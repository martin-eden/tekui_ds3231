-- "Save" button actions

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

-- Import:
local patch_table = request('!.table.patch')

-- Select patchset of data to save depending of tabs page:
local get_data_subset =
  function(Me)
    local TekUi_App = Me.TekUi_App

    local Result = { }

    local TabsPane = TekUi_App:getById('tabs_pane')
    local tab_no = TabsPane.PageNumber
    local tab_name = TabsPane.PageCaptions[tab_no]

    local UiData = Me:DataFromUi()

    -- Sorry for hardcoded page names:
    if (tab_name == 'moment') then
      Result.Moment = UiData.Moment
    elseif (tab_name == 'alarm 1') then
      Result.Alarm_1 = UiData.Alarm_1
    elseif (tab_name == 'alarm 2') then
      Result.Alarm_2 = UiData.Alarm_2
    elseif (tab_name == 'core') then
      Result.Core = UiData.Core
    else
      error(string.format('Unknown tab name "%s".', tab_name))
    end

    return Result
  end

--[[
  Save values from input fields to device

  This function saves values only from current selected tab page.

  Data is loaded, patched, saved and loaded back.
]]
local func_save =
  function(Me)
    if not Me:DataFromRaw() then return end

    local UiData = get_data_subset(Me)

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
