-- Set fields for "other" page

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local element_exists = request('internals.element_exists')
local ws_set_checkbox = request('!.frontend.tekui.set_checkbox')
local prefix_args = request('!.function.prefix_args')
local ws_set_radiomark = request('!.frontend.tekui.set_radiomark')
local ws_set_input_text = request('!.frontend.tekui.set_input_text')
local str_format = string.format

return
  function(tekui_app, core_rec)
    if not element_exists(tekui_app, 'is_busy') then return end

    local set_checkbox = prefix_args(ws_set_checkbox, tekui_app)
    local set_radiomark = prefix_args(ws_set_radiomark, tekui_app)
    local set_input_text = prefix_args(ws_set_input_text, tekui_app)

    set_checkbox('is_busy', core_rec.is_busy)
    set_checkbox('time_is_spoiled', core_rec.time_is_spoiled)

    set_checkbox(
      'atbattery_clock_disabled', core_rec.atbattery_clock_disabled
    )
    set_checkbox(
      'atbattery_enable_wave', core_rec.atbattery_enable_wave
    )

    set_checkbox(
      'output_is_from_alarms', core_rec.output_is_from_alarms
    )
    set_checkbox('enable_wave_32k', core_rec.enable_wave_32k)

    set_input_text(
      'temperature', str_format('%.2f', core_rec.temperature)
    )
    set_checkbox('get_temperature', core_rec.get_temperature)

    set_input_text('speed_trim', tostring(core_rec.speed_trim))

    set_radiomark(
      'wave_freq_num_' .. tostring(core_rec.wave_freq_num)
    )
  end

--[[
  2020 #
  2026 # # #
]]
