-- Raw data provider (local file)

--[[
  Author: Martin Eden
  Last mod.: 2026-05-09
]]

local file_name =
  'Widget/Internals/RawDataProvider/Internals/Virtual/' .. 'raw_state.data.is'

-- Export:
return
  {
    -- Main:
    Init = request('Init'),
    Load = request('Load'),
    Save = request('Save'),

    -- Internals:
    RawDataFileName = file_name,
  }

--[[
  2026-04-28
]]
