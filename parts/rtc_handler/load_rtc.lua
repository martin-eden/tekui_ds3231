-- Read RTC state from device and parse it

--[[
  Author: Martin Eden
  Last mod.: 2026-04-27
]]

-- Imports:
local parse_rtc = request('!.concepts.rtc_ds3231.parse')

-- Request, load and parse RTC data
local load_rtc_state =
  function(self)
    self.compiler.request.i2c_read(
      self.compiler,
      self.device_id,
      0,
      19
    )

    while self:get_next_chunk() do
    end

    local records, status = self.parser:parse()

    if (#records > 0) then
      for _, rec in ipairs(records) do
        if
          (rec.type == 'i2c_reply') and
          (rec.device_id == self.device_id)
        then
          return parse_rtc(rec.data)
        end
      end
    end
  end

-- Export:
return load_rtc_state

--[[
  2020 # #
]]
