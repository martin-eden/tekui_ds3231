-- Represent first alarm

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local represent_alarm = request('represent_alarm')

local represent_alarm_1 =
  function(Rtc_Rec)
    return represent_alarm(Rtc_Rec.alarm_1)
  end

-- Export:
return represent_alarm_1

--[[
  2020 #
  2026-04-28
]]
