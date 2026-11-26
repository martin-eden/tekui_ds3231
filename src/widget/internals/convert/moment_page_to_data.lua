-- Our representation of "moment" page values

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local element_exists = request('internals.element_exists')
local prefix_args = request('!.function.prefix_args')
local ws_get_input_number = request('!.frontend.tekui.get_input_number')
local ws_get_checkbox = request('!.frontend.tekui.get_checkbox')
local to_two_digits_num = request('internals.to_two_digits_num')

return
  function(tekui_app)
    if not element_exists(tekui_app, 'moment_year') then
      return { }
    end

    local get_input_number = prefix_args(ws_get_input_number, tekui_app)
    local get_checkbox = prefix_args(ws_get_checkbox, tekui_app)

    return
      {
        year = to_two_digits_num(get_input_number('moment_year')),
        is_next_century = get_checkbox('moment_is_next_century'),

        month = to_two_digits_num(get_input_number('moment_month')),
        date = to_two_digits_num(get_input_number('moment_date')),
        day = to_two_digits_num(get_input_number('moment_day')),

        hour = to_two_digits_num(get_input_number('moment_hour')),
        store_hour_in_12h = get_checkbox('moment_store_hour_in_12h'),

        minute = to_two_digits_num(get_input_number('moment_minute')),
        second = to_two_digits_num(get_input_number('moment_second')),
      }
  end

--[[
  2020
  2026 # #
]]
