-- Return RTC record according to GUI values

--[[
  Author: Martin Eden
  Last mod.: 2026-05-15
]]

-- Imports:
local merge_and_patch = request('!.table.merge_and_patch')

local get_moment = request('Internals.OurDataAndUi.moment_page_to_data')
local get_alarm_1 = request('Internals.OurDataAndUi.alarm_1_page_to_data')
local get_alarm_2 = request('Internals.OurDataAndUi.alarm_2_page_to_data')
local get_core = request('Internals.OurDataAndUi.core_page_to_data')

local DataFromUi =
  function(Me)
    local TekUi_App = Me.TekUi_App

    local UiData =
      {
        Moment = get_moment(TekUi_App),
        Alarm_1 = get_alarm_1(TekUi_App),
        Alarm_2 = get_alarm_2(TekUi_App),
        Core = get_core(TekUi_App),
      }

    merge_and_patch(Me.Data, UiData)
  end

-- Export:
return DataFromUi

--[[
  2020 #
  2026-04-28
  2026-05-09
  2026-05-15
]]
