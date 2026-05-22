-- Create "core" interface block

--[[
  Author: Martin Eden
  Last mod.: 2026-05-22
]]

-- Imports:
local create_hor_group = request('wrappers.create_hor_group')
local create_ver_group = request('wrappers.create_ver_group')
local create_annotated_input = request('wrappers.create_annotated_input')
local create_checkbox = request('wrappers.create_checkbox')
local create_choice_item = request('wrappers.create_choice_item')

local create_freq_selector_block =
  function()
    return
      create_hor_group(
        {
          caption = 'wave',
          Contents =
            {
              create_choice_item('wave_freq_num_0', '1 Hz'),
              create_choice_item('wave_freq_num_1', '1 KiHz'),
              create_choice_item('wave_freq_num_2', '4 KiHz'),
              create_choice_item('wave_freq_num_3', '8 KiHz'),
            },
        }
      )
end

local create_square_wave_block =
  function()
    return
      create_ver_group(
        {
          caption = 'output pin',
          Contents =
            {
              create_freq_selector_block(),
              create_checkbox('output_is_from_alarms', 'output ALARMS, not wave'),
            },
        }
      )
  end

local create_battery_mode_block =
  function()
    return
      create_ver_group(
        {
          caption = 'at battery',
          Contents =
            {
              create_checkbox('atbattery_clock_disabled', 'stop clock'),
              create_checkbox('atbattery_enable_wave', 'enable wave output'),
            },
        }
      )
  end

local create_temperature_block =
  function()
    return
      create_hor_group(
        {
          caption = 'temperature',
          Contents =
            {
              create_annotated_input('temperature', 50, 'temperature'),
              create_checkbox('get_temperature', 'get temperature'),
            },
        }
      )
  end

local create_output_pins_block =
  function()
    return
      create_ver_group(
        {
          caption = 'output',
          Contents =
            {
              create_checkbox('enable_wave_32k', 'Enable 32 KiHz pin'),
              create_square_wave_block(),
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
              create_checkbox('is_busy', 'is busy'),
              create_checkbox('time_is_spoiled', 'clock was stopped'),
              create_annotated_input('speed_trim', 40, 'clock speed trimming'),
              create_output_pins_block(),
              create_battery_mode_block(),
              create_temperature_block(),
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
