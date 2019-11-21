local update_presentations = request('update_presentations.run')

local update_delta = 0.2

local update_representations =
  function(app)
    local cur_time, last_time = 0, 0
    while true do
      cur_time = os.clock()
      if (cur_time - last_time >= update_delta) then
        update_presentations(app)
        last_time = cur_time
      end
      app:suspend()
    end
  end

return
  function(self, app)
    app:addCoroutine(update_representations, app)
  end
