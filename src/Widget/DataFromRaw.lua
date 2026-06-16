-- Load data from data provider, parse and store it

--[[
  Author: Martin Eden
  Last mod.: 2026-06-16
]]

-- Imports:
local bytes_to_str = request('!.convert.bytes_to_str')
local parse_raw_data = request('!.concepts.codec_ds3231.parse')
local data_from_rtc = request('Internals.convert.data_from_rtc')

local DataFromRaw =
  function(Me)
    local RawData = Me.RawDataProvider:Load()

    if (#RawData == 0) then print('Load() broke') end
    if (#RawData == 0) then return end

    local RtcRec = parse_raw_data(bytes_to_str(RawData))

    Me.Data = data_from_rtc(RtcRec)
  end

-- Export:
return DataFromRaw


--[[
  2026-05-09
  2026-05-15
]]
