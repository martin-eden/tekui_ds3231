-- Open device file and setup for I2C

--[[
  Author: Martin Eden
  Last mod.: 2026-04-27
]]

-- Imports:
local set_tty_params = request('!.mechs.tty.set_params')
local file_exists = request('!.file_system.file.exists')
local sleep = request('!.system.sleep')
local get_next_tty_name = request('get_next_tty_name')
local firmata_init_i2c = request('firmata_init_i2c')

-- Tested warmup delays: 3.7- 3.9+
local init_delay = 4.2
local baud = 57600
local read_timeout = 0.2

-- Open TTY and setup Firmata for I2C
local open_and_init_rtc_device =
  function(self)
    local orig_tty_name = self.tty_name
    repeat
      print(('Opening "%s".'):format(self.tty_name))

      local is_ok, err_msg
      if not file_exists(self.tty_name) then
        is_ok = false
        err_msg = 'No such file.'
      else
        is_ok, err_msg =
          pcall(
            set_tty_params,
            self.tty_name,
            {
              ReadTimeout_S = read_timeout,
              Speed_Bps = baud,
            }
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

-- Export:
return open_and_init_rtc_device

--[[
  2020
]]
