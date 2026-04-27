-- Interface of raw data provider

--[[
  Author: Martin Eden
  Last mod.: 2026-04-29
]]

-- local get_data_dump = request('!.frontend.text.get_data_dump')

local Load =
  function(Me)
    local Result = Me.ActualProvider:Load()
    -- you may insert debug prints here
    -- print(get_data_dump(Result))

    return Result
  end

local Save =
  function(Me, RawData)
    Me.ActualProvider:Save(RawData)
  end

-- Export:
return
  {
    -- Main:
    Init = request('Init'),
    Load = Load,
    Save = Save,
    -- Internals:
    ActualProvider = {},
  }

--[[
  2026-04-28
  2026-04-29
]]
