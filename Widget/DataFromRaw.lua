-- Load data from data provider, parse and store it

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

-- Imports:
local bytes_to_str = request('!.convert.bytes_to_str')
local our_data_from_rtc = request('Internals.convert.our_data_from_rtc')

local DataFromRaw =
  function(Me)
    local RawData = Me.RawDataProvider:Load()

    if (#RawData == 0) then print('Load() broke') end
    if (#RawData == 0) then return false end

    local RtcRec = Me.Ds3231_Codec:Parse(bytes_to_str(RawData))

    Me.Data = our_data_from_rtc(RtcRec)

    return true
  end

-- Export:
return DataFromRaw


--[[
  2026-05-09
]]
