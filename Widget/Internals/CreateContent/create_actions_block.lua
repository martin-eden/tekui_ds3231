-- Create actions block

--[[
  Author: Martin Eden
  Last mod.: 2026-04-29
]]

-- Imports:
local func_load = request('^.funcs.load')
local func_save = request('^.funcs.save')
local create_button = request('wrappers.create_button')
local create_hor_group = request('wrappers.create_hor_group')

local Load_Btn =
  {
    Text = '_Load',
    Handler = func_load,
  }

local Save_Btn =
  {
    Text = '_Save',
    Handler = func_save,
  }

-- Create actions block
local create_actions_block =
  function(Me)
    return
      create_hor_group(
        {
          Contents =
            {
              create_button(Me, Load_Btn),
              create_button(Me, Save_Btn),
            },
        }
      )
  end

-- Export:
return create_actions_block

--[[
  2019 #
  2020 #
  2026-04-27
]]
