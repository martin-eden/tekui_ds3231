-- Return RTC record according to GUI values

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local merge = request('!.table.merge')
local get_moment = request('GetFields.get_moment')
local get_alarm_1 = request('GetFields.get_alarm_1')
local get_alarm_2 = request('GetFields.get_alarm_2')
local get_other = request('GetFields.get_other')

local GetFields =
  function(Me, TekUi_App)
    assert_table(TekUi_App)

    local Result = {}
    merge(Result, get_moment(TekUi_App))
    merge(Result, get_alarm_1(TekUi_App))
    merge(Result, get_alarm_2(TekUi_App))
    merge(Result, get_other(TekUi_App))

    return Result
  end

-- Export:
return GetFields

--[[
  2020 #
  2026-04-28
]]
