--[[
  Add coroutine that calls update_presentations().

  update_presentations() updates all status texts according
  to current UI values.

  There is some performance impact as "app:suspend(<window>)"
  pauses next call for just 2 ms. To mitigate it and call
  status recalculation rarer, counter added.
]]

return
  function(self, app)
    local update_representations =
      function(app)
        local times_to_call = 10
        local cnt = 0
        while true do
          if (cnt == 0) then
            self:update_presentations(app)
          end
          cnt = (cnt + 1) % times_to_call
          app:suspend(app.Children[1])
        end
      end
    app:addCoroutine(update_representations, app)
  end
