-- Create part of our data from "alarm 1" page values

--[[
  Author: Martin Eden
  Last mod.: 2026-05-11
]]

-- Imports:
local ws_get_checkbox = request('!.frontend.tekui.get_checkbox')
local ws_get_input_number = request('!.frontend.tekui.get_input_number')
local prefix_args = request('!.function.prefix_args')
local to_two_digits_num = request('Internals.to_two_digits_num')

local get_alarm_1_page =
  function(TekUi_App)
    local get_checkbox = prefix_args(ws_get_checkbox, TekUi_App)
    local get_input_number = prefix_args(ws_get_input_number, TekUi_App)

    return
      {
        enabled = get_checkbox('alarm_1_enabled'),
        occurred = get_checkbox('alarm_1_occurred'),

        dateday = to_two_digits_num(get_input_number('alarm_1_dateday')),
        is_day = get_checkbox('alarm_1_is_day'),
        ignore_dateday = get_checkbox('alarm_1_dateday_any'),

        hour = to_two_digits_num(get_input_number('alarm_1_hour')),
        store_hour_in_12h = get_checkbox('alarm_1_store_hour_in_12h'),
        ignore_hour = get_checkbox('alarm_1_hour_any'),

        minute = to_two_digits_num(get_input_number('alarm_1_minute')),
        ignore_minute = get_checkbox('alarm_1_minute_any'),

        second = to_two_digits_num(get_input_number('alarm_1_second')),
        ignore_second = get_checkbox('alarm_1_second_any'),
      }
  end

-- Export:
return get_alarm_1_page

--[[
  2020
  2026-05-10
  2026-05-11
]]
