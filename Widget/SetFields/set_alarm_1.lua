-- Set fields for "alarm_1" page

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local prefix_args = request('!.function.prefix_args')
local set_checkbox_stock = request('!.frontend.tekui.set_checkbox')
local set_input_text_stock = request('!.frontend.tekui.set_input_text')
local set_radiomark_binary_stock =
  request('!.frontend.tekui.set_radiomark_binary')

local SetAlarm1Page =
  function(TekUi_App, Rtc_Rec)
    local set_checkbox = prefix_args(set_checkbox_stock, TekUi_App)
    local set_input_text = prefix_args(set_input_text_stock, TekUi_App)
    local set_radiomark_binary =
      prefix_args(set_radiomark_binary_stock, TekUi_App)

    set_checkbox(
      'alarm_1_enabled', Rtc_Rec.alarm_1.enabled
    )
    set_checkbox(
      'alarm_1_occurred', Rtc_Rec.alarm_1.occurred
    )
    set_input_text(
      'alarm_1_date_dow', Rtc_Rec.alarm_1.date_dow
    )
    set_input_text(
      'alarm_1_hour', Rtc_Rec.alarm_1.hour
    )
    set_input_text(
      'alarm_1_minute', Rtc_Rec.alarm_1.minute
    )
    set_input_text(
      'alarm_1_second', Rtc_Rec.alarm_1.second
    )
    set_radiomark_binary(
      'alarm_1_day_spec',
      'alarm_1_day_any',
      Rtc_Rec.alarm_1.ignore_date_dow
    )
    set_radiomark_binary(
      'alarm_1_hour_spec',
      'alarm_1_hour_any',
      Rtc_Rec.alarm_1.ignore_hour
    )
    set_radiomark_binary(
      'alarm_1_minute_spec',
      'alarm_1_minute_any',
      Rtc_Rec.alarm_1.ignore_minute
    )
    set_radiomark_binary(
      'alarm_1_second_spec',
      'alarm_1_second_any',
      Rtc_Rec.alarm_1.ignore_second
    )
    set_checkbox(
      'alarm_1_is_date_not_dow',
      Rtc_Rec.alarm_1.is_date_not_dow
    )
    set_checkbox(
      'alarm_1_store_hour_in_12h',
      Rtc_Rec.alarm_1.store_hour_in_12h
    )
  end

-- Export:
return SetAlarm1Page

--[[
  2020 #
  2026-04-28
]]
