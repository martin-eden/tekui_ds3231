-- Interface of raw data provider

--[[
  Author: Martin Eden
  Last mod.: 2026-05-09
]]

--[[
  Interface

    Init [f]
    Load [f]
    Save [f]
]]

-- Export:
return
  {
    -- Main:
    Init = request('Init'),
    Load =
      function(Me)
        return Me.ActualProvider:Load()
      end,
    Save =
      function(Me, RawData)
        Me.ActualProvider:Save(RawData)
      end,

    -- Internals:
    ActualProvider = {},
  }

--[[
  2026-04-28
  2026-04-29
  2026-05-09
]]
