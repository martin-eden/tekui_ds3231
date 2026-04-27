-- Query device to get temperature and set it in UI

--[[
  Author: Martin Eden
  Last mod.: 2026-04-27
]]

-- Imports:
local sleep = request('!.system.sleep')

local sleep_time = 0.15
local max_tries = 10

local func_get_temp =
  function(Me, TekUi_App)
    local Device_Rtc_Rec = Me.RtcDataProvider:Load()

    Device_Rtc_Rec.get_temperature = true
    Me.RtcDataProvider:Save(Device_Rtc_Rec)

    for _ = 1, max_tries do
      sleep(sleep_time)
      Device_Rtc_Rec = Me.RtcDataProvider:Load()
      if not Device_Rtc_Rec.get_temperature then
        break
      end
    end

    Me:SetFields(TekUi_App, Device_Rtc_Rec)
  end

-- Export:
return func_get_temp

--[[
  2019 #
  2020 # #
  2026-04-27
]]
