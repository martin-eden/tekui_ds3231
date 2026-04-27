-- Raw data provider (local file)

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Export:
return
  {
    -- Main:
    Init = request('Init'),
    Load = request('Load'),
    Save = request('Save'),

    -- Internals:
    RawDataFileName = 'raw_state.data.is',
  }

--[[
  2026-04-28
]]
