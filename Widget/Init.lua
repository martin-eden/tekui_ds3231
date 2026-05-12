-- Startup sequence for widget

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

local Init =
  function(Me)
    if not Me:DataFromRaw() then return false end
    Me:DataToUi()
    Me:InstallPresentationUpdaters()
    return true
  end

-- Export:
return Init

--[[
  2026-04-28
  2026-05-12
]]
