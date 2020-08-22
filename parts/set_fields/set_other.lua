--[[
  Set fields for "other" page.
]]

local prefix_args = request('!.function.prefix_args')
local set_checkbox_stock = request('!.frontend.tekui.set_checkbox')
local set_radiomark_stock = request('!.frontend.tekui.set_radiomark')
local set_input_text_stock = request('!.frontend.tekui.set_input_text')

return
  function(app, rtc_rec)
    local set_checkbox = prefix_args(set_checkbox_stock, app)
    local set_radiomark = prefix_args(set_radiomark_stock, app)
    local set_input_text = prefix_args(set_input_text_stock, app)

    set_checkbox(
      'allow_wave_output',
      rtc_rec.at_battery.allow_wave_output
    )
    set_checkbox(
      'stop_clock',
      rtc_rec.at_battery.stop_clock
    )
    set_checkbox(
      'clock_was_stopped',
      rtc_rec.at_battery.clock_was_stopped
    )

    set_radiomark(
      'wave_freq_' .. rtc_rec.wave_freq
    )
    set_checkbox(
      'output_alarms_not_wave',
      rtc_rec.output_alarms_not_wave
    )
    set_checkbox(
      'enable_wave_32k',
      rtc_rec.enable_wave_32k
    )
    set_input_text(
      'clock_speed',
      rtc_rec.clock_speed
    )
    set_input_text(
      'temperature',
      rtc_rec.temperature
    )
    set_checkbox(
      'get_temperature',
      rtc_rec.get_temperature
    )
    set_checkbox(
      'is_busy',
      rtc_rec.is_busy
    )
  end
