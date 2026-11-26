-- Prepare periodic events

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

local create_ticker =
  function(handler, handler_data, period)
    local num_calls_before_update = period
    local num_calls_done = num_calls_before_update

    return
      function(_, msg)
        if (num_calls_done == num_calls_before_update) then
          handler(handler_data)
          num_calls_done = 0
        end
        num_calls_done = num_calls_done + 1
        return msg
      end
  end

return
  function(me)
    local load_data_from_device =
      create_ticker(me.data_from_raw, me, 210)
    local update_representations =
      create_ticker(me.update_presentations, me, 30)
    return { load_data_from_device, update_representations }
  end

--[[
  2019 #
  2020 #
  2026 # #
]]
