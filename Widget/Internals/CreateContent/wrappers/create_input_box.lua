-- Create input box in TekUI

--[[
  Author: Martin Eden
  Last mod.: 2026-05-21
]]

--[[
  Input data

    name [?s]
    value [?s]
    Overrides [?t]
]]

-- Imports:
local ws_create_input_box = request('!.frontend.tekui.input_box')

local create_input_box =
  function(InputBox)
    local name = InputBox.name
    local value = InputBox.value
    local Overrides = InputBox.Overrides

    return ws_create_input_box(value, name, Overrides)
  end

-- Export:
return create_input_box

--[[
  2026-05-21
]]
