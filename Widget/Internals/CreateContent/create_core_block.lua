-- Create "core" interface block

--[[
  Author: Martin Eden
  Last mod.: 2026-05-21
]]

-- Imports:
local create_hor_group = request('wrappers.create_hor_group')
local create_ver_group = request('wrappers.create_ver_group')
local create_input_box = request('wrappers.create_input_box')
local text_label_la = request('!.frontend.tekui.text_label_la')
local radio_mark = request('!.frontend.tekui.radio_button')
local checkbox = request('!.frontend.tekui.checkbox')

local create_freq_selector_block =
  function(Me)
    return
      create_hor_group(
        {
          caption = 'wave',
          Contents =
            {
              radio_mark('1 Hz', 'wave_freq_num_0'),
              radio_mark('1 KiHz', 'wave_freq_num_1'),
              radio_mark('4 KiHz', 'wave_freq_num_2'),
              radio_mark('8 KiHz', 'wave_freq_num_3'),
            },
        }
      )
end

local create_square_wave_block =
  function(Me)
    return
      create_ver_group(
        {
          caption = 'output pin',
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
          caption = 'at battery',
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
              create_input_box(
                { name = 'speed_trim', Overrides = { Width = 40 } }
              ),
              text_label_la('clock speed trimming'),
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
              create_input_box(
                { name = 'temperature', Overrides = { Width = 50 } }
              ),
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
          caption = 'temperature',
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
            },
        }
      )
  end

local create_output_pins_block =
  function(Me)
    return
      create_ver_group(
        {
          caption = 'output',
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
              checkbox('is busy', false, 'is_busy'),
              checkbox('clock was stopped', false, 'time_is_spoiled'),
              create_speed_trim_input_block(Me),
              create_output_pins_block(Me),
              create_battery_mode_block(Me),
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
  2026-05-13
]]
