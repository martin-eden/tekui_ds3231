-- "Load" button actions

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- "Load" actions
local func_load =
  function(Me, TekUi_App)
    Me:SetFields(TekUi_App, Me.RtcDataProvider:Load())
  end

-- Export:
return func_load

--[[
  2020 #
  2026-04-28
]]
