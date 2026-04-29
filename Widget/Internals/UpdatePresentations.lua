-- Update data presentations (text labels)

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

-- Imports:
local represent_moment = request('representers.represent_moment')
local represent_alarm = request('representers.represent_alarm')
local represent_core = request('representers.represent_core')

local UpdatePresentations =
  function(Me)
    local TekUi_App = Me.TekUi_App

    local OurData = Me:DataFromUi()

    local run_representer =
      function(elem_id, presenter, DataRec)
        local is_ok, result = pcall(presenter, DataRec)
        if not is_ok then
          result = "Can't represent"
        end
        TekUi_App:getById(elem_id):setValue('Text', result)
      end

    run_representer(
      'moment_presentation',
      represent_moment,
      OurData.Moment
    )
    run_representer(
      'alarm_1_presentation',
      represent_alarm,
      OurData.Alarm_1
    )
    run_representer(
      'alarm_2_presentation',
      represent_alarm,
      OurData.Alarm_2
    )
    run_representer(
      'other_presentation',
      represent_core,
      OurData.Core
    )
  end

-- Export:
return UpdatePresentations

--[[
  2020 #
  2026-04-28
  2026-05-09
]]
