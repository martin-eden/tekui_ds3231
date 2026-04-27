-- "Save" button actions

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Select patchset of data to save depending of tabs page:
local get_data_subset =
  function(Me, TekUi_App)
    local Result = {}

    local TabsPane = TekUi_App:getById('tabs_pane')
    local tab_no = TabsPane.PageNumber
    local tab_name = TabsPane.PageCaptions[tab_no]

    local Gui_Rtc_Rec = Me:GetFields(TekUi_App)

    -- Sorry for hardcoded page names:
    if (tab_name == 'moment') then
      Result.moment = Gui_Rtc_Rec.moment
    elseif (tab_name == 'alarm 1') then
      Result.alarm_1 = Gui_Rtc_Rec.alarm_1
    elseif (tab_name == 'alarm 2') then
      Result.alarm_2 = Gui_Rtc_Rec.alarm_2
    elseif (tab_name == 'other') then
      Result = Gui_Rtc_Rec
      Result.moment = nil
      Result.alarm_1 = nil
      Result.alarm_2 = nil
    else
      error(('Unknown tab name "%s".'):format(tab_name))
    end

    return Result
  end

--[[
  Save values from input fields to device

  This function saves values only from current selected tab page.
]]
local func_save =
  function(Me, TekUi_App)
    local Device_Rtc_Rec = Me.RtcDataProvider:Load()
    local Gui_Rtc_Rec = get_data_subset(Me, TekUi_App)
    local Rtc_Rec = new(Device_Rtc_Rec, Gui_Rtc_Rec)

    Me.RtcDataProvider:Save(Rtc_Rec)
    Me:SetFields(TekUi_App, Me.RtcDataProvider:Load())
  end

-- Export:
return func_save

--[[
  2020 #
  2026-04-28
]]
