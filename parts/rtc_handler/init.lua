local tty_set_non_blocking_read= request('!.mechs.tty.set_non_blocking_read')
local file_exists = request('!.file.exists')
local sleep = request('!.system.sleep')

local get_next_tty_name = request('get_next_tty_name')
local firmata_init_i2c = request('firmata_init_i2c')

local init_delay = 3.50
local baud = 57600
local read_timeout = 0.2

return
  function(self)
    local orig_tty_name = self.tty_name
    repeat
      print(('Trying to open "%s".'):format(self.tty_name))

      local is_ok, err_msg
      if not file_exists(self.tty_name) then
        is_ok = false
        err_msg = 'No such file.'
      else
        is_ok, err_msg =
          pcall(
            tty_set_non_blocking_read,
            self.tty_name,
            read_timeout,
            baud
          )
      end

      if not is_ok then
        print(self.tty_name, err_msg)
        self.tty_name = get_next_tty_name(self.tty_name)
        -- Round-trip done?
        if (self.tty_name == orig_tty_name) then
          error("Can't find Arduino on any of USB ports.")
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

    firmata_init_i2c(self)
  end
