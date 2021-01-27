--[[
  Set fields for "alarm_2" page.
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
      'alarm_2_enabled',
      rtc_rec.alarm_2.enabled
    )
    set_checkbox(
      'alarm_2_occurred',
      rtc_rec.alarm_2.occurred
    )
    set_input_text(
      'alarm_2_date_dow',
      rtc_rec.alarm_2.date_dow
    )
    set_input_text(
      'alarm_2_hour',
      rtc_rec.alarm_2.hour
    )
    set_input_text(
      'alarm_2_minute',
      rtc_rec.alarm_2.minute
    )
    set_radiomark_binary(
      'alarm_2_day_spec',
      'alarm_2_day_any',
      rtc_rec.alarm_2.ignore_date_dow
    )
    set_radiomark_binary(
      'alarm_2_hour_spec',
      'alarm_2_hour_any',
      rtc_rec.alarm_2.ignore_hour
    )
    set_radiomark_binary(
      'alarm_2_minute_spec',
      'alarm_2_minute_any',
      rtc_rec.alarm_2.ignore_minute
    )
    set_checkbox(
      'alarm_2_is_date_not_dow',
      rtc_rec.alarm_2.is_date_not_dow
    )
end
