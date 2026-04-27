-- Save raw data

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local itness_to_str = request('!.convert.itness_to_str')
local save_str_to_file = request('!.string.to_file')

local Save =
  function(Me, RawData)
    for i = 1, #RawData do
      RawData[i] = string.format('%03d', RawData[i])
    end

    local raw_data_str = itness_to_str(RawData)

    save_str_to_file(raw_data_str, Me.RawDataFileName)
  end

-- Export:
return Save

--[[
  2020
  2026-04-27
  2026-04-28
]]
