-- Our representation of "moment" page values

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

-- Imports:
local prefix_args = request('!.function.prefix_args')
local ws_get_input_number = request('!.frontend.tekui.get_input_number')
local ws_get_checkbox = request('!.frontend.tekui.get_checkbox')
local to_two_digits_num = request('Internals.to_two_digits_num')

local get_moment_page =
  function(TekUi_App)
    local get_input_number = prefix_args(ws_get_input_number, TekUi_App)
    local get_checkbox = prefix_args(ws_get_checkbox, TekUi_App)

    return
      {
        year = to_two_digits_num(get_input_number('moment_year')),
        is_next_century = get_checkbox('moment_is_next_century'),

        month = to_two_digits_num(get_input_number('moment_month')),
        date = to_two_digits_num(get_input_number('moment_date')),
        dow = to_two_digits_num(get_input_number('moment_day')),

        hour = to_two_digits_num(get_input_number('moment_hour')),
        store_hour_in_12h = get_checkbox('moment_store_hour_in_12h'),

        minute = to_two_digits_num(get_input_number('moment_minute')),
        second = to_two_digits_num(get_input_number('moment_second')),
      }
  end

-- Export:
return get_moment_page

--[[
  2020
  2026-05-09
]]
