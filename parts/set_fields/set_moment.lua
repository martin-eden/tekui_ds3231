--[[
  Set fields for "moment" page.
]]

local prefix_args = request('!.function.prefix_args')
local set_input_text_stock = request('!.frontend.tekui.set_input_text')
local set_checkbox_stock = request('!.frontend.tekui.set_checkbox')

return
  function(app, rtc_rec)
    local set_input_text = prefix_args(set_input_text_stock, app)
    local set_checkbox = prefix_args(set_checkbox_stock, app)

    set_input_text(
      'moment_year',
      rtc_rec.moment.year
    )
    set_input_text(
      'moment_month',
      ('%02d'):format(rtc_rec.moment.month)
    )
    set_input_text(
      'moment_date',
      ('%02d'):format(rtc_rec.moment.date)
    )
    set_input_text(
      'moment_dow',
      rtc_rec.moment.dow
    )
    set_input_text(
      'moment_hour',
      ('%02d'):format(rtc_rec.moment.hour)
    )
    set_input_text(
      'moment_minute',
      ('%02d'):format(rtc_rec.moment.minute)
    )
    set_input_text(
      'moment_second',
      ('%02d'):format(rtc_rec.moment.second)
    )
    set_checkbox(
      'moment_store_hour_in_12h',
      rtc_rec.moment.store_hour_in_12h
    )
  end
