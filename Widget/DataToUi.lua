-- Set GUI values according to RTC record

--[[
  Author: Martin Eden
  Last mod.: 2026-05-22
]]

-- Imports:
local set_moment = request('Internals.convert.moment_page_from_data')
local set_alarm_1 = request('Internals.convert.alarm_1_page_from_data')
local set_alarm_2 = request('Internals.convert.alarm_2_page_from_data')
local set_core = request('Internals.convert.core_page_from_data')

local DataToUi =
  function(Me)
    local TekUi_App = Me.TekUi_App

    local OurData = Me.Data

    _G.IsLoadingRawValues = true

    set_moment(TekUi_App, OurData.Moment)
    set_alarm_1(TekUi_App, OurData.Alarm_1)
    set_alarm_2(TekUi_App, OurData.Alarm_2)
    set_core(TekUi_App, OurData.Core)

    _G.IsLoadingRawValues = false

    Me:UpdatePresentations(TekUi_App)
  end

-- Export:
return DataToUi

--[[
  2020 #
  2026-04-28
  2026-05-09
  2026-05-12
]]
