-- Check for reachability of element by it's id

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

local element_exists =
  function(TekUi_App, element_id)
    return not is_nil(TekUi_App:getById(element_id))
  end

-- Export:
return element_exists

--[[
  2026-05-12
]]
