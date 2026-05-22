-- Create TekUi checkbox

--[[
  Author: Martin Eden
  Last mod.: 2026-05-22
]]

--[[
  Input format

    name [s] -- identifier
    description [s] -- UI description line
    Overrides [t?] -- optional TekUi properties
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
