-- Represent second alarm

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local represent_alarm = request('represent_alarm')

local represent_alarm_2 =
  function(Rtc_Rec)
    return represent_alarm(Rtc_Rec.alarm_2)
  end

-- Export:
return represent_alarm_2

--[[
  2020 #
  2026-04-28
]]
