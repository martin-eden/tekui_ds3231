-- "Save" button actions

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

-- Import:
local patch_table = request('!.table.patch')

--[[
  Save values from input fields to device

  This function saves values only from current selected tab page.

  Data is loaded, patched, saved and loaded back.
]]
local func_save =
  function(Me)
    if not Me:DataFromRaw() then return end

    local UiData = Me:DataFromUi()

    patch_table(Me.Data, UiData)

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
]]
