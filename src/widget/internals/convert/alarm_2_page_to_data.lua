-- Create part of RTC record for "alarm 2" page values

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local element_exists = request('internals.element_exists')
local ws_get_checkbox = request('!.frontend.tekui.get_checkbox')
local prefix_args = request('!.function.prefix_args')
local ws_get_input_number = request('!.frontend.tekui.get_input_number')
local to_two_digits_num = request('internals.to_two_digits_num')

return
  function(tekui_app)
    if not element_exists(tekui_app, 'alarm_2_enabled') then
      return { }
    end

    local get_checkbox = prefix_args(ws_get_checkbox, tekui_app)
    local get_input_number = prefix_args(ws_get_input_number, tekui_app)

    return
      {
        enabled = get_checkbox('alarm_2_enabled'),
        occurred = get_checkbox('alarm_2_occurred'),

        dateday = to_two_digits_num(get_input_number('alarm_2_dateday')),
        is_day = get_checkbox('alarm_2_is_day'),
        ignore_dateday = get_checkbox('alarm_2_dateday_any'),

        hour = to_two_digits_num(get_input_number('alarm_2_hour')),
        store_hour_in_12h = get_checkbox('alarm_2_store_hour_in_12h'),
        ignore_hour = get_checkbox('alarm_2_hour_any'),

        minute = to_two_digits_num(get_input_number('alarm_2_minute')),
        ignore_minute = get_checkbox('alarm_2_minute_any'),
      }
  end

--[[
  2020
  2026 # # #
]]
