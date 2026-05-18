-- Create "Moment" page

--[[
  Author: Martin Eden
  Last mod.: 2026-05-18
]]

-- ( Imports
local func_set_cur_time = request('^.funcs.set_cur_time')
local func_set_end_of_day = request('^.funcs.set_end_of_day')

local create_hor_group = request('wrappers.create_hor_group')
local create_ver_group = request('wrappers.create_ver_group')

local input_box = request('!.frontend.tekui.input_box')
local checkbox = request('!.frontend.tekui.checkbox')
local create_button = request('wrappers.create_button')
-- )

local SetCurTime_Btn =
  {
    text = 'Set _current time',
    handler = func_set_cur_time,
  }

local SetEndOfDay_Btn =
  {
    text = 'Set _end of day',
    handler = func_set_end_of_day,
  }

local create_moment_inputs_block =
  function(Me)
    return
      create_hor_group(
        {
          Overrides = { Width = 'free' },
          Contents =
            {
              input_box('', 'moment_year'),
              input_box('', 'moment_month'),
              input_box('', 'moment_date'),
              input_box('', 'moment_day'),
              input_box('', 'moment_hour'),
              input_box('', 'moment_minute'),
              input_box('', 'moment_second')
            },
        }
      )
  end

local create_buttons_block =
  function(Me)
    return
      create_hor_group(
        {
          Contents =
            {
              create_button(Me, SetCurTime_Btn),
              create_button(Me, SetEndOfDay_Btn),
            },
        }
      )
  end

local create_moment_block =
  function(Me)
    return
      create_ver_group(
        {
          Overrides = { Width = Me.ui_width },
          Contents =
            {
              create_moment_inputs_block(Me),
              checkbox('AM/PM hour format', false, 'moment_store_hour_in_12h'),
              checkbox('Is next century', false, 'moment_is_next_century'),
              create_buttons_block(Me),
            },
        }
      )
  end

-- Export:
return create_moment_block

--[[
  2019 #
  2020 #
  2026-04-28
  2026-05-11
]]
