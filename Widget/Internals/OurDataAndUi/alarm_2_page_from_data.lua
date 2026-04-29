-- Set fields for "alarm 2" page

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

-- Imports:
local prefix_args = request('!.function.prefix_args')
local ws_set_checkbox = request('!.frontend.tekui.set_checkbox')
local ws_set_input_text = request('!.frontend.tekui.set_input_text')
local ws_set_radiomark_binary = request('!.frontend.tekui.set_radiomark_binary')
local to_two_digits_str = request('Internals.to_two_digits_str')

local set_alarm_2_page =
  function(TekUi_App, Alarm)
    local set_checkbox = prefix_args(ws_set_checkbox, TekUi_App)
    local set_input_text = prefix_args(ws_set_input_text, TekUi_App)
    local set_radiomark_binary = prefix_args(ws_set_radiomark_binary, TekUi_App)

    set_checkbox(
      'alarm_2_enabled', Alarm.enabled
    )
    set_checkbox(
      'alarm_2_occurred', Alarm.occurred
    )

    set_input_text(
      'alarm_2_dateday', to_two_digits_str(Alarm.dateday)
    )
    set_checkbox(
      'alarm_2_is_day', Alarm.is_day
    )
    set_radiomark_binary(
      'alarm_2_dateday_spec',
      'alarm_2_dateday_any',
      Alarm.ignore_dateday
    )

    set_input_text(
      'alarm_2_hour', to_two_digits_str(Alarm.hour)
    )
    set_checkbox(
      'alarm_2_store_hour_in_12h', Alarm.store_hour_in_12h
    )
    set_radiomark_binary(
      'alarm_2_hour_spec',
      'alarm_2_hour_any',
      Alarm.ignore_hour
    )

    set_input_text(
      'alarm_2_minute', to_two_digits_str(Alarm.minute)
    )
    set_radiomark_binary(
      'alarm_2_minute_spec',
      'alarm_2_minute_any',
      Alarm.ignore_minute
    )
end

-- Export:
return set_alarm_2_page

--[[
  2020 #
  2026-04-28
  2026-05-09
  2026-05-10
]]
