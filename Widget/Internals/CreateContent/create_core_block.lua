-- Create "core" interface block

--[[
  Author: Martin Eden
  Last mod.: 2026-05-11
]]

-- Imports:
local func_get_temp = request('^.funcs.get_temp')
local create_hor_group = request('wrappers.create_hor_group')
local create_ver_group = request('wrappers.create_ver_group')
local one_of_el = request('!.frontend.tekui.radio_button')
local text_label = request('!.frontend.tekui.text_label')
local text_label_ra = request('!.frontend.tekui.text_label_ra')
local text_label_la = request('!.frontend.tekui.text_label_la')
local input_box = request('!.frontend.tekui.input_box')
local checkbox = request('!.frontend.tekui.checkbox')
local create_button = request('wrappers.create_button')

local GetTemp_Btn =
  {
    Text = 'Measure _temperature',
    Handler = func_get_temp,
  }

local create_presentation_block =
  function(Me)
    return
      create_hor_group(
        {
          Text = '',
          Contents =
            {
              text_label(
                '',
                {
                  Style = Me.ui_status_style,
                  Id = 'other_presentation',
                }
              ),
            },
        }
      )
  end

local create_freq_selector_block =
  function(Me)
    return
      create_hor_group(
        {
          Text = 'Wave',
          Contents =
            {
              one_of_el('1 Hz', nil, 'wave_freq_num_0'),
              one_of_el('1 KiHz', nil, 'wave_freq_num_1'),
              one_of_el('4 KiHz', nil, 'wave_freq_num_2'),
              one_of_el('8 KiHz', nil, 'wave_freq_num_3'),
            },
        }
      )
end

local create_square_wave_block =
  function(Me)
    return
      create_ver_group(
        {
          Text = 'output pin',
          Contents =
            {
              create_freq_selector_block(Me),
              checkbox(
                'output ALARMS, not wave',
                false,
                'output_is_from_alarms',
                { Width = 'fill' }
              ),
            },
        }
      )
  end

local create_battery_mode_block =
  function(Me)
    return
      create_ver_group(
        {
          Text = 'at battery',
          Contents =
            {
              checkbox('stop clock', false, 'atbattery_clock_disabled'),
              checkbox('enable wave output', false, 'atbattery_enable_wave'),
            },
        }
      )
  end

local create_speed_trim_input_block =
  function(Me)
    return
      create_hor_group(
        {
          Contents =
            {
              input_box('', 'speed_trim', { Width = 50 }),
              text_label_la('clock limit adjustment [-128, 127]'),
            },
        }
      )
  end

local create_temperature_input_block =
  function(Me)
    return
      create_hor_group(
        {
          Contents =
            {
              input_box('', 'temperature', { Width = 50 }),
              text_label_la('temperature'),
            },
        }
      )
  end

local create_temperature_block =
  function(Me)
    return
      create_ver_group(
        {
          Text = 'Temperature',
          Contents =
            {
              create_hor_group(
                {
                  Contents =
                    {
                      create_temperature_input_block(Me),
                      checkbox('get temperature', false, 'get_temperature'),
                    },
                }
              ),
              create_button(Me, GetTemp_Btn),
            },
        }
      )
  end

local create_output_pins_block =
  function(Me)
    return
      create_ver_group(
        {
          Text = 'output',
          Contents =
            {
              checkbox('Enable 32 KiHz pin', false, 'enable_wave_32k'),
              create_square_wave_block(Me),
            },
        }
      )
  end

local create_core_block =
  function(Me)
    return
      create_ver_group(
        {
          Overrides = { Width = Me.ui_width },
          Contents =
            {
              create_presentation_block(Me),
              checkbox('is busy', false, 'is_busy'),
              checkbox('clock was stopped', false, 'time_is_spoiled'),
              create_output_pins_block(Me),
              create_battery_mode_block(Me),
              create_speed_trim_input_block(Me),
              create_temperature_block(Me),
            },
        }
      )
  end

-- Export:
return create_core_block

--[[
  2020 #
  2026-04-27
  2026-04-28
  2026-04-29
  2026-05-10
]]
