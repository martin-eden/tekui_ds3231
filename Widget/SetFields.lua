-- Set GUI values according to RTC record

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local set_moment = request('SetFields.set_moment')
local set_alarm_1 = request('SetFields.set_alarm_1')
local set_alarm_2 = request('SetFields.set_alarm_2')
local set_other = request('SetFields.set_other')

local SetFields =
  function(Me, TekUi_App, Rtc_Rec)
    assert_table(TekUi_App)
    assert_table(Rtc_Rec)

    _G.IsLoadingRawValues = true

    set_moment(TekUi_App, Rtc_Rec)
    set_alarm_1(TekUi_App, Rtc_Rec)
    set_alarm_2(TekUi_App, Rtc_Rec)
    set_other(TekUi_App, Rtc_Rec)

    _G.IsLoadingRawValues = false

    Me:UpdatePresentations(TekUi_App)
  end

-- Export:
return SetFields

--[[
  2020 #
  2026-04-28
]]
