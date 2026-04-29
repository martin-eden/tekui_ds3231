-- Startup sequence for widget

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

local Init =
  function(Me, TekUi_App)
    Me.TekUi_App = TekUi_App

    Me:InstallPresentationUpdaters()

    if not Me:DataFromRaw() then return false end

    Me:DataToUi()

    return true
  end

-- Export:
return Init

--[[
  2026-04-28
]]
