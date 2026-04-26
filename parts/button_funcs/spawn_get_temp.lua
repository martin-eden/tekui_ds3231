-- Return function to query device to get temp and set it in UI

--[[
  Author: Martin Eden
  Last mod.: 2026-04-27
]]

-- Imports:
local sleep = request('!.system.sleep')

local sleep_time = 0.15
local max_tries = 10

local reload_temperature =
  function(self)
    return
      function(app)
        local parsed_rtc

        for _ = 1, max_tries do
          parsed_rtc = self.rtc_handler:load_rtc()
          if not parsed_rtc.is_busy then
            break
          end
          sleep(sleep_time)
        end

        parsed_rtc.get_temperature = true
        self.rtc_handler:save_rtc(parsed_rtc)

        for _ = 1, max_tries do
          sleep(sleep_time)
          parsed_rtc = self.rtc_handler:load_rtc()
          if not parsed_rtc.get_temperature then
            break
          end
        end

        self:set_fields(app, parsed_rtc)
      end
  end

-- Export:
return reload_temperature

--[[
  2019 #
  2020 # #
]]
