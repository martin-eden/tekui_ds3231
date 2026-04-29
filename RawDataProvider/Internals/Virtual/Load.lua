-- Load raw data

--[[
  Author: Martin Eden
  Last mod.: 2026-05-09
]]

-- Imports:
local require_file = request('!.system.require_file')
local itness_from_str = request('!.convert.itness_from_str')

local Load =
  function(Me)
    local raw_data_str = require_file(Me.RawDataFileName)

    local RawData = itness_from_str(raw_data_str)

    for i = 1, #RawData do
      RawData[i] = tonumber(RawData[i])
    end

    return RawData
  end

-- Export:
return Load

--[[
  2020
  2026-04-27
  2026-04-28
]]
