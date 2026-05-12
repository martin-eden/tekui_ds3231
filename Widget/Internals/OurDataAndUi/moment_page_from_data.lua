-- Set fields for "moment" page according to our custom record

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

-- Imports:
local prefix_args = request('!.function.prefix_args')
local ws_set_input_text = request('!.frontend.tekui.set_input_text')
local ws_set_checkbox = request('!.frontend.tekui.set_checkbox')
local to_two_digits_str = request('Internals.to_two_digits_str')
local element_exists = request('Internals.element_exists')

local set_moment_page =
  function(TekUi_App, Moment)
    if not element_exists(TekUi_App, 'moment_year') then return end

    local set_input_text = prefix_args(ws_set_input_text, TekUi_App)
    local set_checkbox = prefix_args(ws_set_checkbox, TekUi_App)

    set_input_text(
      'moment_year', to_two_digits_str(Moment.year)
    )
    set_checkbox(
      'moment_is_next_century', Moment.is_next_century
    )

    set_input_text(
      'moment_month', to_two_digits_str(Moment.month)
    )
    set_input_text(
      'moment_date', to_two_digits_str(Moment.date)
    )
    set_input_text(
      'moment_day', tostring(Moment.day)
    )

    set_input_text(
      'moment_hour', to_two_digits_str(Moment.hour)
    )
    set_checkbox(
      'moment_store_hour_in_12h', Moment.store_hour_in_12h
    )

    set_input_text(
      'moment_minute', to_two_digits_str(Moment.minute)
    )
    set_input_text(
      'moment_second', to_two_digits_str(Moment.second)
    )
  end

-- Export:
return set_moment_page

--[[
  2020 #
  2026-04-28
  2026-05-09
  2026-05-10
  2026-05-12
]]
