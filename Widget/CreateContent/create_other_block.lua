-- Create "other" interface block

--[[
  Author: Martin Eden
  Last mod.: 2026-04-29
]]

--[[
  Beware, names of elements of "freq" block are used in [get_fields].
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
    Text = 'Measure _temperature immediately',
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
          Text = '',
          Overrides = { Columns = 2 },
          Contents =
            {
              one_of_el('1 Hz', nil, 'wave_freq_1'),
              one_of_el('1024 Hz', nil, 'wave_freq_1024'),
              one_of_el('4096 Hz', nil, 'wave_freq_4096'),
              one_of_el('8192 Hz', nil, 'wave_freq_8192'),
            },
        }
      )
end

local create_square_wave_block =
  function(Me)
    return
      create_hor_group(
        {
          Text = 'output pin signal',
          Contents =
            {
              create_freq_selector_block(Me),
              checkbox(
                'output ALARMS, not wave',
                false,
                'output_alarms_not_wave',
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
              checkbox('enable wave output', false, 'allow_wave_output'),
              checkbox('stop clock', false, 'stop_clock'),
              checkbox('clock was stopped', false, 'clock_was_stopped'),
            },
        }
      )
  end

local create_clock_speed_input_block =
  function(Me)
    return
      create_hor_group(
        {
          Contents =
            {
              input_box('', 'clock_speed', { Width = 50 }),
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

local create_other_block =
  function(Me)
    return
      create_ver_group(
        {
          Overrides = { Width = Me.ui_width },
          Contents =
            {
              create_presentation_block(Me),
              create_square_wave_block(Me),
              create_battery_mode_block(Me),
              checkbox('Enable 32 KiHz pin', false, 'enable_wave_32k'),
              create_clock_speed_input_block(Me),
              create_temperature_input_block(Me),
              checkbox('get temperature', false, 'get_temperature'),
              checkbox('is busy', false, 'is_busy'),
              create_button(Me, GetTemp_Btn)
            },
        }
      )
  end

-- Export:
return create_other_block

--[[
  2020 #
  2026-04-28
]]
