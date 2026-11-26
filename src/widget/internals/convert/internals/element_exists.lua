-- Check for reachability of element by it's id

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

return
  function(tekui_app, element_id)
    return not is_nil(tekui_app:getById(element_id))
  end

--[[
  2026 #
]]
