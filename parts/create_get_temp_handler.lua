local delay = request('!.system.delay')

local delay_time = 0.15
local max_tries = 10

return
  function(self)
    return
      function(tui_self)
        local parsed_rtc

        for _ = 1, max_tries do
          parsed_rtc = self.rtc_handler:load_rtc()
          if not parsed_rtc.is_busy then
            break
          end
          delay(delay_time)
        end

        parsed_rtc.converting_temperature = true
        self.rtc_handler:save_rtc(parsed_rtc)

        for _ = 1, max_tries do
          delay(delay_time)
          parsed_rtc = self.rtc_handler:load_rtc()
          if not not parsed_rtc.converting_temperature then
            break
          end
        end

        self.set_fields(tui_self.Application, parsed_rtc)
      end
  end
