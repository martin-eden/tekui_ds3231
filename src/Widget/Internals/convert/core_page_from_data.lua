-- Set fields for "other" page

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

-- Imports:
local ws_set_checkbox = request('!.frontend.tekui.set_checkbox')
local ws_set_radiomark = request('!.frontend.tekui.set_radiomark')
local ws_set_input_text = request('!.frontend.tekui.set_input_text')
local prefix_args = request('!.function.prefix_args')
local element_exists = request('Internals.element_exists')

local set_other_settings_page =
  function(TekUi_App, CoreRec)
    if not element_exists(TekUi_App, 'is_busy') then return end

    local set_checkbox = prefix_args(ws_set_checkbox, TekUi_App)
    local set_radiomark = prefix_args(ws_set_radiomark, TekUi_App)
    local set_input_text = prefix_args(ws_set_input_text, TekUi_App)

    set_checkbox(
      'is_busy', CoreRec.is_busy
    )
    set_checkbox(
      'time_is_spoiled', CoreRec.time_is_spoiled
    )

    set_checkbox(
      'atbattery_clock_disabled', CoreRec.atbattery_clock_disabled
    )
    set_checkbox(
      'atbattery_enable_wave', CoreRec.atbattery_enable_wave
    )

    set_checkbox(
      'output_is_from_alarms', CoreRec.output_is_from_alarms
    )
    set_checkbox(
      'enable_wave_32k', CoreRec.enable_wave_32k
    )

    set_input_text(
      'temperature', string.format('%.2f', CoreRec.temperature)
    )
    set_checkbox(
      'get_temperature', CoreRec.get_temperature
    )

    set_input_text(
      'speed_trim', tostring(CoreRec.speed_trim)
    )

    set_radiomark(
      'wave_freq_num_' .. tostring(CoreRec.wave_freq_num)
    )
  end

-- Export:
return set_other_settings_page

--[[
  2020 #
  2026-04-28
  2026-05-10
  2026-05-12
]]
