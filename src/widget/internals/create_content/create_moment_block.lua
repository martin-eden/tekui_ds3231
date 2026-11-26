-- Create "Moment" page

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

local func_set_cur_time = request('^.funcs.set_cur_time')
local func_set_end_of_day = request('^.funcs.set_end_of_day')

local create_hor_group = request('!.frontend.tekui.create_hor_group')
local create_ver_group = request('!.frontend.tekui.create_ver_group')
local create_annotated_ver_input = request('wrappers.create_annotated_ver_input')
local create_input_box = request('!.frontend.tekui.create_input_box')
local create_checkbox = request('wrappers.create_checkbox')
local create_button = request('wrappers.create_button')

local set_cur_time__btn =
  { text = 'Set _current time', handler = func_set_cur_time }

local set_end_of_day__btn =
  { text = 'Set _end of day', handler = func_set_end_of_day }

local create_moment_inputs_block =
  function()
    return
      create_hor_group(
        {
          Contents =
            {
              create_annotated_ver_input('moment_year', 'year'),
              create_annotated_ver_input('moment_month', 'month'),
              create_annotated_ver_input('moment_date', 'date'),
              create_annotated_ver_input('moment_day', 'day'),
              create_annotated_ver_input('moment_hour', 'hour'),
              create_annotated_ver_input('moment_minute', 'minute'),
              create_annotated_ver_input('moment_second', 'second'),
            },
        }
      )
  end

local create_buttons_block =
  function(me)
    return
      create_hor_group(
        {
          Contents =
            {
              create_button(me, set_cur_time__btn),
              create_button(me, set_end_of_day__btn),
            },
        }
      )
  end

-- Export:
return
  function(me, ui_width)
    return
      create_ver_group(
        {
          Overrides = { Width = ui_width },
          Contents =
            {
              create_moment_inputs_block(),
              create_checkbox('moment_is_next_century', 'Is next century'),
              create_checkbox('moment_store_hour_in_12h', 'AM/PM hour format'),
              create_buttons_block(me),
            },
        }
      )
  end

--[[
  2019 #
  2020 #
  2026 # #
]]
