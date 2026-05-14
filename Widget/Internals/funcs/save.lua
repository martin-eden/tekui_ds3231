-- "Save" button actions

--[[
  Author: Martin Eden
  Last mod.: 2026-05-15
]]

--[[
  Save values from input fields to device

  Data is loaded from device, updated with values from UI,
  saved to device, loaded back, and UI values are updated.
]]
local func_save =
  function(Me)
    Me:DataFromRaw()
    Me:DataFromUi()
    Me:DataToRaw()
    Me:DataFromRaw()
    Me:DataToUi()
  end

-- Export:
return func_save

--[[
  2020 #
  2026-04-28
  2026-05-09
  2026-05-10
  2026-05-15
]]
