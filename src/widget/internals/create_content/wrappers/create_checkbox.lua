-- Create TekUi checkbox

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

--[[
  Input format

    1 [s] -- identifier
    2 [s] -- UI description line
    3 [t?] -- optional TekUi properties to override
]]

-- Imports:
local ws_create_checkbox = request('!.frontend.tekui.checkbox')

local create_checkbox =
  function(name, description, Overrides)
    return ws_create_checkbox(description, false, name, Overrides)
  end

return create_checkbox

--[[
  2026 #
]]
