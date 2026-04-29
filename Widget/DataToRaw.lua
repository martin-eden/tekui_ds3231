-- Compile our data and send it to raw data provider

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

-- Imports:
local bytes_from_str = request('!.convert.bytes_from_str')
local our_data_to_rtc = request('Internals.convert.our_data_to_rtc')

local DataToRaw =
  function(Me)
    local RtcRec = our_data_to_rtc(Me.Data)
    local data_str = Me.Ds3231_Codec:Compile(RtcRec)
    Me.RawDataProvider:Save(bytes_from_str(data_str))
  end

-- Export:
return DataToRaw

--[[
  2026-05-09
]]
