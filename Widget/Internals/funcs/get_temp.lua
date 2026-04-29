-- Query device to get temperature and set it in UI

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

-- Imports:
local sleep = request('!.system.sleep')

local sleep_time_s = 0.15
local num_max_tries = 10

local func_get_temp =
  function(Me)
    Me:DataFromRaw()

    Me.Data.get_temperature = true

    Me:DataToRaw()

    for _ = 1, num_max_tries do
      sleep(sleep_time_s)
      Me:DataFromRaw()
      if not Me.Data.get_temperature then break end
    end

    Me:DataToUi()
  end

-- Export:
return func_get_temp

--[[
  2019 #
  2020 # #
  2026-04-27
  2026-05-10
]]
