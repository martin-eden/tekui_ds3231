--[[
  Create part of RTC record for "moment" page values.
]]

local prefix_args = request('!.function.prefix_args')
local get_input_number_stock = request('!.frontend.tekui.get_input_number')
local get_checkbox_stock = request('!.frontend.tekui.get_checkbox')

return
  function(app)
    local get_input_number = prefix_args(get_input_number_stock, app)
    local get_checkbox = prefix_args(get_checkbox_stock, app)

    local result =
      {
        moment =
          {
            year = get_input_number('moment_year'),
            month = get_input_number('moment_month'),
            date = get_input_number('moment_date'),
            dow = get_input_number('moment_dow'),
            hour = get_input_number('moment_hour'),
            store_hour_in_12h = get_checkbox('moment_store_hour_in_12h'),
            minute = get_input_number('moment_minute'),
            second = get_input_number('moment_second'),
          },
      }

    return result
  end
