-- Widget interface

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

--[[
  Storage format

    1 [t] -- model data (RTC data in application)
    2 [t] -- raw data provider instance
    3 [t] -- TekUi application instance
]]

local run =
  function(me)
    me[3]:run()
  end

local interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  local init = request('init')
  create =
    function(data_provider)
      local me = { { }, data_provider, { } }
      attach_methods(me, interface)
      init(me)
      return me
    end
end

interface =
  {
    create = create,
    run = run,
    data_from_raw = request('data_from_raw'),
    data_to_ui = request('data_to_ui'),
    data_from_ui = request('data_from_ui'),
    data_to_raw = request('data_to_raw'),
    update_presentations = request('internals.represent'),
  }

-- Export:
return interface

--[[
  2019 #
  2020 # # #
  2026 # # # # # #
  2026-11-27
]]
