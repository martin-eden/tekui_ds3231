-- Raw data provider (local file)

--[[
  Author: Martin Eden
  Last mod.: 2026-05-09
]]

-- Export:
return
  {
    -- Main:
    Init = request('Init'),
    Load = request('Load'),
    Save = request('Save'),

    -- Internals:
    RawDataFileName = 'RawDataProvider/Internals/Virtual/raw_state.data.is',
  }

--[[
  2026-04-28
]]
