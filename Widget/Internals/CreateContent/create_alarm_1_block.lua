-- Create "alarm 1" block

--[[
  Author: Martin Eden
  Last mod.: 2026-05-22
]]

-- Imports:
local create_hor_group = request('!.frontend.tekui.create_hor_group')
local create_ver_group = request('!.frontend.tekui.create_ver_group')
local create_input_box = request('wrappers.create_input_box')
local create_checkbox = request('wrappers.create_checkbox')
local create_choice_item = request('wrappers.create_choice_item')
local spawn_correct_alarm_flags = request('spawn_correct_alarm_flags')

local correct_flags_any =
  spawn_correct_alarm_flags(
    {
      'alarm_1_dateday_any',
      'alarm_1_hour_any',
      'alarm_1_minute_any',
      'alarm_1_second_any',
      NextOffset = -1,
    }
  )

local correct_flags_spec =
  spawn_correct_alarm_flags(
    {
      'alarm_1_dateday_spec',
      'alarm_1_hour_spec',
      'alarm_1_minute_spec',
      'alarm_1_second_spec',
      NextOffset = 1,
    }
  )

local create_any_rb =
  function(elem_id)
    return
      create_choice_item(
        elem_id, 'any', { onSelect = correct_flags_any }
      )
  end

local create_spec_rb =
  function(elem_id)
    return
      create_choice_item(
        elem_id, 'specific', { onSelect = correct_flags_spec }
      )
  end

local create_day_select_block =
  function()
    return
      create_ver_group(
        {
          caption = 'day',
          Overrides = { Width = 'free' },
          Contents =
            {
              create_any_rb('alarm_1_dateday_any'),
              create_spec_rb('alarm_1_dateday_spec'),
              create_input_box('alarm_1_dateday'),
            },
        }
      )
  end

local create_hour_select_block =
  function()
    return
      create_ver_group(
        {
          caption = 'hour',
          Overrides = { Width = 'free' },
          Contents =
            {
              create_any_rb('alarm_1_hour_any'),
              create_spec_rb('alarm_1_hour_spec'),
              create_input_box('alarm_1_hour'),
            },
        }
      )
  end

local create_minute_select_block =
  function()
    return
      create_ver_group(
        {
          caption = 'minute',
          Overrides = { Width = 'free' },
          Contents =
            {
              create_any_rb('alarm_1_minute_any'),
              create_spec_rb('alarm_1_minute_spec'),
              create_input_box('alarm_1_minute'),
            },
        }
      )
  end

local create_second_select_block =
  function()
    return
      create_ver_group(
        {
          caption = 'second',
          Overrides = { Width = 'free' },
          Contents =
            {
              create_any_rb('alarm_1_second_any'),
              create_spec_rb('alarm_1_second_spec'),
              create_input_box('alarm_1_second'),
            },
        }
      )
  end

local create_alarm_inputs_block =
  function()
    return
      create_hor_group(
        {
          Contents =
            {
              create_day_select_block(),
              create_hour_select_block(),
              create_minute_select_block(),
              create_second_select_block(),
            },
        }
      )
  end

local create_alarm_1_block =
  function(Me)
    return
      create_ver_group(
        {
          Overrides = { Width = Me.ui_width },
          Contents =
            {
              create_checkbox('alarm_1_occurred', 'occurred'),
              create_checkbox('alarm_1_enabled', 'enable output'),
              create_alarm_inputs_block(),
              create_checkbox('alarm_1_is_day', 'is day of week'),
              create_checkbox('alarm_1_store_hour_in_12h', 'AM/PM hour format'),
            },
        }
      )
  end

-- Export:
return create_alarm_1_block

--[[
  2019 #
  2020 #
  2026-05-10
]]
