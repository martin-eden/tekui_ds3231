-- Save raw data

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

-- Imports:
local itness_to_str = request('!.convert.itness_to_str')
local save_to_file = request('!.convert.file_from_str')

local Save =
  function(Me, RawData)
    for i = 1, #RawData do
      RawData[i] = string.format('%03d', RawData[i])
    end

    local raw_data_str = itness_to_str(RawData)

    save_to_file(raw_data_str, Me.RawDataFileName)
  end

-- Export:
return Save

--[[
  2020
  2026-04-27
  2026-04-28
]]
