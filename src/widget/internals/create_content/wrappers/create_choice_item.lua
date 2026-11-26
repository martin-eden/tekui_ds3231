-- [TekUi] Create item in select-one-of list

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

--[[
  Input format (same as for checkbox)

    1 [s] -- identifier
    2 [s] -- UI description line
    3 [t?] -- optional TekUi properties to override
]]

local ws_create_choice_item = request('!.frontend.tekui.radio_button')

return
  function(name, description, overrides)
    return ws_create_choice_item(description, name, overrides)
  end

--[[
  2026 #
]]
