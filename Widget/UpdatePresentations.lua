-- Update data presentations (text labels)

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local represent_moment = request('UpdatePresentations.represent_moment')
local represent_alarm_1 = request('UpdatePresentations.represent_alarm_1')
local represent_alarm_2 = request('UpdatePresentations.represent_alarm_2')
local represent_other = request('UpdatePresentations.represent_other')

local UpdatePresentations =
  function(Me, TekUi_App)
    local Rtc_Rec = Me:GetFields(TekUi_App)

    local run_representer =
      function(elem_id, presenter)
        local is_ok, result = pcall(presenter, Rtc_Rec)
        if not is_ok then
          result = "Can't represent. Bad data?"
        end
        TekUi_App:getById(elem_id):setValue('Text', result)
      end

    run_representer('moment_presentation', represent_moment)
    run_representer('alarm_1_presentation', represent_alarm_1)
    run_representer('alarm_2_presentation', represent_alarm_2)
    run_representer('other_presentation', represent_other)
  end

-- Export:
return UpdatePresentations

--[[
  2020 #
  2026-04-28
]]
