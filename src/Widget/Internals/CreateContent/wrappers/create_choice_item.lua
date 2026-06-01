-- [TekUi] Create item in select-one-of list

--[[
  Author: Martin Eden
  Last mod.: 2026-05-22
]]

--[[
  Input format (same as for checkbox)

    1 name [s] -- identifier
    2 description [s] -- UI description line
    3 Overrides [t?] -- optional TekUi properties
]]

-- Imports:
local ws_create_choice_item = request('!.frontend.tekui.radio_button')

local create_choice_item =
  function(name, description, Overrides)
    return ws_create_choice_item(description, name, Overrides)
  end

-- Export:
return create_choice_item

--[[
  2026-05-22
]]
