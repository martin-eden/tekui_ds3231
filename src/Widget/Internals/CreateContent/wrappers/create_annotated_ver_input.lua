-- [TekUi] Create input box grouped with annotation text above

--[[
  Author: Martin Eden
  Last mod.: 2026-05-22
]]

--[[
  Input structure

    1 name [s] -- name of input box
    2 description [s] -- annotation text
]]

-- Imports:
local create_ver_group = request('!.frontend.tekui.create_ver_group')
local create_input_box = request('!.frontend.tekui.create_input_box')

local create_annotated_ver_input =
  function(name, description)
    return
      create_ver_group(
        {
          caption = description,
          Overrides = { Width = 'free' },
          Contents = { create_input_box(name) },
        }
      )
  end

-- Export:
return create_annotated_ver_input

--[[
  2026-05-22
]]
