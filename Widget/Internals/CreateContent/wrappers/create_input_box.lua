-- Create input box in TekUI

--[[
  Author: Martin Eden
  Last mod.: 2026-05-22
]]

--[[
  Input data

    1 name [s]
    2 Overrides [?t]
]]

-- Imports:
local ws_create_input_box = request('!.frontend.tekui.input_box')

local create_input_box =
  function(name, Overrides)
    assert_string(name)

    local value = ''

    return ws_create_input_box(value, name, Overrides)
  end

-- Export:
return create_input_box

--[[
  2026-05-21
  2026-05-22
]]
