-- Create TekUi checkbox

--[[
  Author: Martin Eden
  Last mod.: 2026-05-22
]]

--[[
  Input format

    1 name [s] -- identifier
    2 description [s] -- UI description line
    3 Overrides [t?] -- optional TekUi properties
]]

-- Imports:
local ws_create_checkbox = request('!.frontend.tekui.checkbox')

local create_checkbox =
  function(name, description, Overrides)
    return ws_create_checkbox(description, false, name, Overrides)
  end

return create_checkbox

--[[
  2026-05-22
]]
