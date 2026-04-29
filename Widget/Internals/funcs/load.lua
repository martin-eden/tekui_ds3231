-- "Load" button actions

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

-- "Load" actions
local func_load =
  function(Me)
    if not Me:DataFromRaw() then return end

    Me:DataToUi()
  end

-- Export:
return func_load

--[[
  2020 #
  2026-04-28
  2026-05-10
]]
