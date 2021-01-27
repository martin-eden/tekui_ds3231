--[[
  Create part of RTC record for "alarm_1" page values.
]]

local prefix_args = request('!.function.prefix_args')
local get_checkbox_stock = request('!.frontend.tekui.get_checkbox')
local get_input_number_stock = request('!.frontend.tekui.get_input_number')

return
  function(app)
    local get_checkbox = prefix_args(get_checkbox_stock, app)
    local get_input_number = prefix_args(get_input_number_stock, app)

    local result =
      {
        alarm_1 =
          {
            enabled = get_checkbox('alarm_1_enabled'),
            occurred = get_checkbox('alarm_1_occurred'),
            date_dow = get_input_number('alarm_1_date_dow'),
            hour = get_input_number('alarm_1_hour'),
            minute = get_input_number('alarm_1_minute'),
            second = get_input_number('alarm_1_second'),
            ignore_date_dow = get_checkbox('alarm_1_day_any'),
            ignore_hour = get_checkbox('alarm_1_hour_any'),
            ignore_minute = get_checkbox('alarm_1_minute_any'),
            ignore_second = get_checkbox('alarm_1_second_any'),
            is_date_not_dow = get_checkbox('alarm_1_is_date_not_dow'),
          },
      }

    return result
  end
