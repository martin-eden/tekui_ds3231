-- Update data presentations (text labels)

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

local represent_moment = request('representers.represent_moment')
local represent_alarm = request('representers.represent_alarm')
local represent_core = request('representers.represent_core')

return
  function(me)
    me:data_from_ui()

    local run_representer =
      function(elem_id, presenter, data_rec)
        local is_ok, result = pcall(presenter, data_rec)
        if not is_ok then
          result = "Can't represent"
        end
        me[3]:getById(elem_id):setValue('Text', result)
      end

    local our_data = me[1]

    run_representer('moment_presentation', represent_moment, our_data.Moment)
    run_representer('alarm_1_presentation', represent_alarm, our_data.Alarm_1)
    run_representer('alarm_2_presentation', represent_alarm, our_data.Alarm_2)
    run_representer('core_presentation', represent_core, our_data.Core)
  end

--[[
  2020 #
  2026 # #
]]
