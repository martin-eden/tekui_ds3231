-- Create part of RTC record for "other" page values

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

-- Imports:
local ws_get_checkbox = request('!.frontend.tekui.get_checkbox')
local ws_get_input_number = request('!.frontend.tekui.get_input_number')
local prefix_args = request('!.function.prefix_args')
local constrain_number = request('!.number.constrain')

local constrain_temperature =
  function(temperature)
    return constrain_number(temperature, -128, 127.75)
  end

local constrain_speed_trim =
  function(speed_trim)
    return constrain_number(speed_trim, -128, 127)
  end

local get_other_settings_rec =
  function(TekUi_App)
    local get_checkbox = prefix_args(ws_get_checkbox, TekUi_App)
    local get_input_number = prefix_args(ws_get_input_number, TekUi_App)

    local get_wave_freq_num =
      function()
        for idx = 0, 3 do
          if get_checkbox('wave_freq_num_' .. tostring(idx)) then
            return idx
          end
        end
        error('No frequency is selected')
      end

    return
      {
        is_busy = get_checkbox('is_busy'),
        time_is_spoiled = get_checkbox('time_is_spoiled'),

        atbattery_clock_disabled = get_checkbox('atbattery_clock_disabled'),
        atbattery_enable_wave = get_checkbox('atbattery_enable_wave'),

        output_is_from_alarms = get_checkbox('output_is_from_alarms'),
        enable_wave_32k = get_checkbox('enable_wave_32k'),

        temperature = constrain_temperature(get_input_number('temperature')),
        get_temperature = get_checkbox('get_temperature'),

        speed_trim = constrain_speed_trim(get_input_number('speed_trim')),

        wave_freq_num = get_wave_freq_num(),
      }
  end

-- Export:
return get_other_settings_rec

--[[
  2020
  2026-05-10
]]
