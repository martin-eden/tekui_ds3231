-- Create part of RTC record for "alarm 2" page values

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

-- Imports:
local ws_get_checkbox = request('!.frontend.tekui.get_checkbox')
local ws_get_input_number = request('!.frontend.tekui.get_input_number')
local prefix_args = request('!.function.prefix_args')
local to_two_digits_num = request('Internals.to_two_digits_num')
local element_exists = request('Internals.element_exists')

local get_alarm_2_page =
  function(TekUi_App)
    if not element_exists(TekUi_App, 'alarm_2_enabled') then
      return { }
    end

    local get_checkbox = prefix_args(ws_get_checkbox, TekUi_App)
    local get_input_number = prefix_args(ws_get_input_number, TekUi_App)

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

-- Export:
return get_alarm_2_page

--[[
  2020
  2026-05-10
  2026-05-11
  2026-05-12
]]
