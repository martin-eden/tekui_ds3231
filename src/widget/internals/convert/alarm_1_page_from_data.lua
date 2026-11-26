-- Set fields for "alarm 1" page

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local element_exists = request('internals.element_exists')
local ws_set_checkbox = request('!.frontend.tekui.set_checkbox')
local ws_set_input_text = request('!.frontend.tekui.set_input_text')
local ws_set_radiomark_binary = request('!.frontend.tekui.set_radiomark_binary')
local prefix_args = request('!.function.prefix_args')
local to_two_digits_str = request('internals.to_two_digits_str')

return
  function(tekui_app, alarm)
    if not element_exists(tekui_app, 'alarm_1_enabled') then return end

    local set_checkbox = prefix_args(ws_set_checkbox, tekui_app)
    local set_input_text = prefix_args(ws_set_input_text, tekui_app)
    local set_radiomark_binary = prefix_args(ws_set_radiomark_binary, tekui_app)

    set_checkbox('alarm_1_enabled', alarm.enabled)
    set_checkbox('alarm_1_occurred', alarm.occurred)

    set_input_text('alarm_1_dateday', to_two_digits_str(alarm.dateday))
    set_checkbox('alarm_1_is_day', alarm.is_day)
    set_radiomark_binary(
      'alarm_1_dateday_spec',
      'alarm_1_dateday_any',
      alarm.ignore_dateday
    )

    set_input_text('alarm_1_hour', to_two_digits_str(alarm.hour))
    set_checkbox('alarm_1_store_hour_in_12h', alarm.store_hour_in_12h)
    set_radiomark_binary(
      'alarm_1_hour_spec',
      'alarm_1_hour_any',
      alarm.ignore_hour
    )

    set_input_text('alarm_1_minute', to_two_digits_str(alarm.minute))
    set_radiomark_binary(
      'alarm_1_minute_spec',
      'alarm_1_minute_any',
      alarm.ignore_minute
    )

    set_input_text('alarm_1_second', to_two_digits_str(alarm.second))
    set_radiomark_binary(
      'alarm_1_second_spec',
      'alarm_1_second_any',
      alarm.ignore_second
    )
  end

--[[
  2020 #
  2026 # # # #
]]
