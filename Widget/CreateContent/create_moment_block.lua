-- Create "Moment" page

--[[
  Author: Martin Eden
  Last mod.: 2026-04-29
]]

-- Imports:
local func_set_cur_time = request('^.funcs.set_cur_time')
local create_hor_group = request('wrappers.create_hor_group')
local create_ver_group = request('wrappers.create_ver_group')
local text_label = request('!.frontend.tekui.text_label')
local input_box = request('!.frontend.tekui.input_box')
local checkbox = request('!.frontend.tekui.checkbox')
local create_button = request('wrappers.create_button')

local SetCurTime_Btn =
  {
    Text = 'Set _current time',
    Handler = func_set_cur_time,
  }

local create_moment_presentation_block =
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
                  Id = 'moment_presentation',
                }
              )
            },
        }
      )
  end

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
              input_box('', 'moment_dow'),
              input_box('', 'moment_hour'),
              input_box('', 'moment_minute'),
              input_box('', 'moment_second')
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
              create_moment_presentation_block(Me),
              create_moment_inputs_block(Me),
              checkbox('AM/PM hour format', false, 'moment_store_hour_in_12h'),
              create_button(Me, SetCurTime_Btn),
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
]]
