-- Load raw data

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local file_as_string = request('!.string.from_file')
local itness_from_str = request('!.convert.itness_from_str')

local Load =
  function(Me)
    local raw_data_str = file_as_string(Me.RawDataFileName)

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
