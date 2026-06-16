-- Compile our data and send it to raw data provider

--[[
  Author: Martin Eden
  Last mod.: 2026-06-16
]]

-- Imports:
local data_to_rtc = request('Internals.convert.data_to_rtc')
local compile_raw_data = request('!.concepts.codec_ds3231.compile')
local bytes_from_str = request('!.convert.bytes_from_str')

local DataToRaw =
  function(Me)
    local RtcRec = data_to_rtc(Me.Data)
    local data_str = compile_raw_data(RtcRec)
    Me.RawDataProvider:Save(bytes_from_str(data_str))
  end

-- Export:
return DataToRaw

--[[
  2026-05-09
]]
