-- Prepare periodic events

--[[
  Author: Martin Eden
  Last mod.: 2026-05-15
]]

local create_ticker =
  function(handler, HandlerData, period)
    local num_calls_before_update = period
    local num_calls_done = num_calls_before_update

    return
      function(TekUi_Window, msg)
        if (num_calls_done == num_calls_before_update) then
          handler(HandlerData)
          num_calls_done = 0
        end

        num_calls_done = num_calls_done + 1

        return msg
      end
  end

local CreateTickers =
  function(Me)
    -- Load data from device
    local load_data_from_device =
      create_ticker(Me.DataFromRaw, Me, 210)

    -- Update status texts
    local update_representations =
      create_ticker(Me.UpdatePresentations, Me, 30)

    return
      {
        load_data_from_device,
        update_representations,
      }
  end

-- Export:
return CreateTickers

--[[
  2019 #
  2020 #
  2026-05-09
  2026-05-15
]]
