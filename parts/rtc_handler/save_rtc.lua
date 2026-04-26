-- Compile state and write it to device

--[[
  Author: Martin Eden
  Last mod.: 2026-04-27
]]

-- Imports:
local compile_rtc = request('!.concepts.rtc_ds3231.compile')

-- Compile RTC data and send it to device
local save_rtc_state =
  function(self, parsed_rtc)
    local raw_rtc = compile_rtc(parsed_rtc)
    self.compiler.request.i2c_write(
      self.compiler,
      self.device_id,
      0,
      table.unpack(raw_rtc)
    )
  end

-- Export:
return save_rtc_state

--[[
  2020 # #
]]
