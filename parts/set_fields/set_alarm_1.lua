--[[
  Set fields for "alarm_1" page.
]]

local prefix_args = request('!.function.prefix_args')
local set_checkbox_stock = request('!.frontend.tekui.set_checkbox')
local set_input_text_stock = request('!.frontend.tekui.set_input_text')
local set_radiomark_binary_stock =
  request('!.frontend.tekui.set_radiomark_binary')

return
  function(app, rtc_rec)
    local set_checkbox = prefix_args(set_checkbox_stock, app)
    local set_input_text = prefix_args(set_input_text_stock, app)
    local set_radiomark_binary =
      prefix_args(set_radiomark_binary_stock, app)

    set_checkbox(
      'alarm_1_enabled',
      rtc_rec.alarm_1.enabled
    )
    set_checkbox(
      'alarm_1_occurred',
      rtc_rec.alarm_1.occurred
    )
    set_input_text(
      'alarm_1_date_dow',
      rtc_rec.alarm_1.date_dow
    )
    set_input_text(
      'alarm_1_hour',
      rtc_rec.alarm_1.hour
    )
    set_input_text(
      'alarm_1_minute',
      rtc_rec.alarm_1.minute
    )
    set_input_text(
      'alarm_1_second',
      rtc_rec.alarm_1.second
    )
    set_radiomark_binary(
      'alarm_1_day_spec',
      'alarm_1_day_any',
      rtc_rec.alarm_1.ignore_date_dow
    )
    set_radiomark_binary(
      'alarm_1_hour_spec',
      'alarm_1_hour_any',
      rtc_rec.alarm_1.ignore_hour
    )
    set_radiomark_binary(
      'alarm_1_minute_spec',
      'alarm_1_minute_any',
      rtc_rec.alarm_1.ignore_minute
    )
    set_radiomark_binary(
      'alarm_1_second_spec',
      'alarm_1_second_any',
      rtc_rec.alarm_1.ignore_second
    )
    set_checkbox(
      'alarm_1_is_date_not_dow',
      rtc_rec.alarm_1.is_date_not_dow
    )
    set_checkbox(
      'alarm_1_store_hour_in_12h',
      rtc_rec.alarm_1.store_hour_in_12h
    )
  end
