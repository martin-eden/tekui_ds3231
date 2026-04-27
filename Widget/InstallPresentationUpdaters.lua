-- Add coroutine that calls UpdatePresentations().

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

--[[
  Update all status texts according to current UI values

  There is some performance impact as "TekUi_App:suspend(<window>)"
  pauses next call for just 2 ms. To mitigate it and call
  status recalculation rarer, counter added.
]]
local install_presentation_updaters =
  function(Me, TekUi_App)
    local update_representations =
      function(TekUi_App)
        local num_calls_before_update = 10
        local num_calls = 0

        while true do
          if (num_calls == 0) then
            Me:UpdatePresentations(TekUi_App)
          end

          num_calls = (num_calls + 1) % num_calls_before_update

          TekUi_App:suspend(TekUi_App.Children[1])
        end
      end

    TekUi_App:addCoroutine(update_representations, TekUi_App)
  end

-- Export:
return install_presentation_updaters

--[[
  2019 #
  2020 #
]]
