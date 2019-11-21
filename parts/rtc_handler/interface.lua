local sleep =
  function(secs)
    assert_number(secs)
    assert(secs > 0)
    local cmd = ('sleep %.2f'):format(secs)
    os.execute(cmd)
  end

local orig_tty_name

local get_next_tty_name =
  function(cur_tty_name)
    assert_string(cur_tty_name)
    local result
    local prefix, index = cur_tty_name:match('(.-)(%d+)$')
    index = (index + 1) % 8
    result = prefix .. ('%d'):format(index)
    -- round-trip done?
    if (result == orig_tty_name) then
      result = nil
    end
    return result
  end

local t2s = request('!.table.as_string')
local file_exists = request('!.file.exists')

local init =
  function(self)
    local init_delay = 3.50
    local baud = 57600
    local read_timeout = 0.2

    local tty = request('!.mechs.tty')
    orig_tty_name = self.tty_name
    repeat
      print(('Trying to open "%s".'):format(self.tty_name))

      local is_ok, err_msg
      if not file_exists(self.tty_name) then
        is_ok = false
        err_msg = 'No such file.'
      else
        is_ok, err_msg =
          pcall(
            tty.set_non_blocking_read,
            self.tty_name,
            read_timeout,
            baud
          )
      end

      if not is_ok then
        print(self.tty_name, err_msg)
        self.tty_name = get_next_tty_name(self.tty_name)
        if not self.tty_name then
          error("Can't find arduino on any of USB ports.")
        end
      end
    until is_ok

    self.f_in = io.open(self.tty_name, 'rb')

    sleep(init_delay)

    self.parser.stream =
      new(request('!.mechs.streams.mergeable.file.interface'))

    self.data_concatter:init()
    self.parser.stream = self.data_concatter:get_stream()

    self.f_out = io.open(self.tty_name, 'wb')
    self.f_out:setvbuf('no')

    self.compiler.output = self.f_out

    self:init_i2c()
  end

local get_next_chunk =
  function(self)
    local max_chunk_size = 128
    local s = self.f_in:read(max_chunk_size)
    if (s == '') then
      s = nil
    end
    if s then
      self.data_concatter:add(s)
      -- print(s)
    end
    return s
  end

local init_i2c =
  function(self)
    self.compiler.request.i2c_config(self.compiler)
  end

local parse_rtc = request('!.formats.ds3231.parse')

local load_rtc =
  function(self)
    self.compiler.request.i2c_read(self.compiler, 0x68, 0, 0x13)

    while self:get_next_chunk() do
    end

    local records, status = self.parser:parse()
    if (#records > 0) then
      for _, rec in ipairs(records) do
        -- print(t2s(rec))
        if
          (rec.type == 'i2c_reply') and
          (rec.device_id == 0x68)
        then
          local result = parse_rtc(rec.data)
          -- print(t2s(result))
          return result
        end
      end
    end
  end

local compile_rtc = request('!.formats.ds3231.compile')

local dump_bits = request('!.frontend.text.dump_bits')

local save_rtc =
  function(self, parsed_rtc)
    -- print(t2s(parsed_rtc))
    local raw_rtc = compile_rtc(parsed_rtc)
    -- print(t2s(raw_rtc))
    -- print(dump_bits(raw_rtc, 0))
    self.compiler.request.i2c_write(
      self.compiler,
      0x68,
      0,
      table.unpack(raw_rtc, 0, #raw_rtc - 1)
    )
  end

return
  {
    tty_name = '/dev/ttyUSB0',
    init = init,
    data_concatter =
      request('!.mechs.streams.data_concatter.interface'),
    parser = request('!.formats.firmata.parser.interface'),
    compiler = request('!.formats.firmata.compiler.interface'),
    get_next_chunk = get_next_chunk,
    init_i2c = init_i2c,
    load_rtc = load_rtc,
    save_rtc = save_rtc,
    --
    f_in = nil,
    f_out = nil,
  }
