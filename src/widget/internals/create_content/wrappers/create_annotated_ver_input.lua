-- [TekUi] Create input box grouped with annotation text above

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

--[[
  Input structure

    1 name [s] -- name of input box
    2 description [s] -- annotation text
]]

local create_input_box = request('!.frontend.tekui.create_input_box')
local create_ver_group = request('!.frontend.tekui.create_ver_group')

return
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

--[[
  2026 #
]]
