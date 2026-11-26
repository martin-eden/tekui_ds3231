-- Set fields for "moment" page according to our custom record

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local element_exists = request('internals.element_exists')
local prefix_args = request('!.function.prefix_args')
local ws_set_input_text = request('!.frontend.tekui.set_input_text')
local ws_set_checkbox = request('!.frontend.tekui.set_checkbox')
local to_two_digits_str = request('internals.to_two_digits_str')

return
  function(tekui_app, moment)
    if not element_exists(tekui_app, 'moment_year') then return end

    local set_input_text = prefix_args(ws_set_input_text, tekui_app)
    local set_checkbox = prefix_args(ws_set_checkbox, tekui_app)

    set_input_text('moment_year', to_two_digits_str(moment.year))
    set_checkbox(
      'moment_is_next_century', moment.is_next_century
    )

    set_input_text('moment_month', to_two_digits_str(moment.month))
    set_input_text('moment_date', to_two_digits_str(moment.date))
    set_input_text('moment_day', tostring(moment.day))

    set_input_text('moment_hour', to_two_digits_str(moment.hour))
    set_checkbox('moment_store_hour_in_12h', moment.store_hour_in_12h)

    set_input_text('moment_minute', to_two_digits_str(moment.minute))
    set_input_text('moment_second', to_two_digits_str(moment.second))
  end

--[[
  2020 #
  2026 # # # #
]]
