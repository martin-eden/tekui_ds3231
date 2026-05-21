-- Create "alarm 2" page contents

--[[
  Author: Martin Eden
  Last mod.: 2026-05-21
]]

-- Imports:
local create_hor_group = request('wrappers.create_hor_group')
local create_ver_group = request('wrappers.create_ver_group')
local create_input_box = request('wrappers.create_input_box')
local checkbox = request('!.frontend.tekui.checkbox')
local radio_mark = request('!.frontend.tekui.radio_button')
local spawn_correct_alarm_flags = request('spawn_correct_alarm_flags')

local correct_flags_any =
  spawn_correct_alarm_flags(
    {
      'alarm_2_dateday_any',
      'alarm_2_hour_any',
      'alarm_2_minute_any',
      NextOffset = -1,
    }
  )

local correct_flags_spec =
  spawn_correct_alarm_flags(
    {
      'alarm_2_dateday_spec',
      'alarm_2_hour_spec',
      'alarm_2_minute_spec',
      NextOffset = 1,
    }
  )

local create_any_rb =
  function(elem_id)
    return
      radio_mark(
        'any', elem_id, { onSelect = correct_flags_any }
      )
  end

local create_spec_rb =
  function(elem_id)
    return
      radio_mark(
        'specific', elem_id, { onSelect = correct_flags_spec  }
      )
  end

local create_day_select_block =
  function(Me)
    return
      create_ver_group(
        {
          caption = 'day',
          Overrides = { Width = 'free' },
          Contents =
            {
              create_any_rb('alarm_2_dateday_any'),
              create_spec_rb('alarm_2_dateday_spec'),
              create_input_box({ name = 'alarm_2_dateday' }),
            },
        }
      )
  end

local create_hour_select_block =
  function(Me)
    return
      create_ver_group(
        {
          caption = 'hour',
          Overrides = { Width = 'free' },
          Contents =
            {
              create_any_rb('alarm_2_hour_any'),
              create_spec_rb('alarm_2_hour_spec'),
              create_input_box({ name = 'alarm_2_hour' }),
            },
        }
      )
  end

local create_minute_select_block =
  function(Me)
    return
      create_ver_group(
        {
          caption = 'minute',
          Overrides = { Width = 'free' },
          Contents =
            {
              create_any_rb('alarm_2_minute_any'),
              create_spec_rb('alarm_2_minute_spec'),
              create_input_box({ name = 'alarm_2_minute' }),
            },
        }
      )
  end

local create_alarm_inputs_block =
  function(Me)
    return
      create_hor_group(
        {
          Contents =
            {
              create_day_select_block(Me),
              create_hour_select_block(Me),
              create_minute_select_block(Me),
            },
        }
      )
  end

local create_alarm_2_block =
  function(Me)
    return
      create_ver_group(
        {
          Overrides = { Width = Me.ui_width },
          Contents =
            {
              checkbox('occurred', false, 'alarm_2_occurred'),
              checkbox('enable output', false, 'alarm_2_enabled'),
              create_alarm_inputs_block(Me),
              checkbox('is day of week', false, 'alarm_2_is_day'),
              checkbox('AM/PM hour format', false, 'alarm_2_store_hour_in_12h'),
            },
        }
      )
  end

-- Export:
return create_alarm_2_block

--[[
  2019
  2020
  2026-04-27
]]
