-- Set fields for "other" page

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local prefix_args = request('!.function.prefix_args')
local set_checkbox_stock = request('!.frontend.tekui.set_checkbox')
local set_radiomark_stock = request('!.frontend.tekui.set_radiomark')
local set_input_text_stock = request('!.frontend.tekui.set_input_text')

local SetOtherPage =
  function(TekUi_App, Rtc_Rec)
    local set_checkbox = prefix_args(set_checkbox_stock, TekUi_App)
    local set_radiomark = prefix_args(set_radiomark_stock, TekUi_App)
    local set_input_text = prefix_args(set_input_text_stock, TekUi_App)

    set_checkbox(
      'allow_wave_output', Rtc_Rec.at_battery.allow_wave_output
    )
    set_checkbox(
      'stop_clock', Rtc_Rec.at_battery.stop_clock
    )
    set_checkbox(
      'clock_was_stopped', Rtc_Rec.at_battery.clock_was_stopped
    )

    set_radiomark(
      'wave_freq_' .. Rtc_Rec.wave_freq
    )
    set_checkbox(
      'output_alarms_not_wave', Rtc_Rec.output_alarms_not_wave
    )
    set_checkbox(
      'enable_wave_32k', Rtc_Rec.enable_wave_32k
    )
    set_input_text(
      'clock_speed', Rtc_Rec.clock_speed
    )
    set_input_text(
      'temperature', Rtc_Rec.temperature
    )
    set_checkbox(
      'get_temperature', Rtc_Rec.get_temperature
    )
    set_checkbox(
      'is_busy', Rtc_Rec.is_busy
    )
  end

-- Export:
return SetOtherPage

--[[
  2020 #
  2026-04-28
]]
