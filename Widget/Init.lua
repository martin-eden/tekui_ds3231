-- Startup sequence for widget

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

local Init =
  function(Me, TekUi_App)
    Me:InstallPresentationUpdaters(TekUi_App)

    local RtcRec = Me.RtcDataProvider:Load()

    if not RtcRec then
      return false
    end

    Me:SetFields(TekUi_App, RtcRec)

    return true
  end

-- Export:
return Init

--[[
  2026-04-28
]]
