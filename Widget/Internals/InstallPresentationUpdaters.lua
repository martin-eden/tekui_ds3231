-- Add coroutine that calls UpdatePresentations().

--[[
  Author: Martin Eden
  Last mod.: 2026-05-09
]]

local InstallPresentationUpdaters =
  function(Me)
    local TekUi_App = Me.TekUi_App

    --[[
      Update all status texts according to current UI values

      "TekUi_App:suspend(<window>)" pauses next call just for 2 ms.
      To call status recalculation rarer, counter added.
    ]]
    local update_representations =
      function()
        local num_calls_before_update = 70
        local num_calls_done = num_calls_before_update

        while true do
          if (num_calls_done == num_calls_before_update) then
            Me:UpdatePresentations()
            num_calls_done = 0
          end

          TekUi_App:suspend(TekUi_App.Children[1])

          num_calls_done = num_calls_done + 1
        end
      end

    TekUi_App:addCoroutine(update_representations, TekUi_App)
  end

-- Export:
return InstallPresentationUpdaters

--[[
  2019 #
  2020 #
  2026-05-09
]]
