-- Set fields for "alarm_2" page

--[[
  Author: Martin Eden
  Last mod.: 2026-04-29
]]

-- Imports:
local prefix_args = request('!.function.prefix_args')
local set_checkbox_stock = request('!.frontend.tekui.set_checkbox')
local set_input_text_stock = request('!.frontend.tekui.set_input_text')
local set_radiomark_binary_stock =
  request('!.frontend.tekui.set_radiomark_binary')

local SetAlarm2Page =
  function(TekUi_App, Rtc_Rec)
    local set_checkbox = prefix_args(set_checkbox_stock, TekUi_App)
    local set_input_text = prefix_args(set_input_text_stock, TekUi_App)
    local set_radiomark_binary =
      prefix_args(set_radiomark_binary_stock, TekUi_App)

    set_checkbox(
      'alarm_2_enabled', Rtc_Rec.alarm_2.enabled
    )
    set_checkbox(
      'alarm_2_occurred', Rtc_Rec.alarm_2.occurred
    )
    set_input_text(
      'alarm_2_date_dow', Rtc_Rec.alarm_2.date_dow
    )
    set_input_text(
      'alarm_2_hour', Rtc_Rec.alarm_2.hour
    )
    set_input_text(
      'alarm_2_minute', Rtc_Rec.alarm_2.minute
    )
    set_radiomark_binary(
      'alarm_2_day_spec',
      'alarm_2_day_any',
      Rtc_Rec.alarm_2.ignore_date_dow
    )
    set_radiomark_binary(
      'alarm_2_hour_spec',
      'alarm_2_hour_any',
      Rtc_Rec.alarm_2.ignore_hour
    )
    set_radiomark_binary(
      'alarm_2_minute_spec',
      'alarm_2_minute_any',
      Rtc_Rec.alarm_2.ignore_minute
    )
    set_checkbox(
      'alarm_2_is_date_not_dow', Rtc_Rec.alarm_2.is_date_not_dow
    )
    set_checkbox(
      'alarm_2_store_hour_in_12h', Rtc_Rec.alarm_2.store_hour_in_12h
    )
end

-- Export:
return SetAlarm2Page

--[[
  2020 #
  2026-04-28
]]
