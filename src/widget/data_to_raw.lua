-- Compile our data and send it to raw data provider

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

local data_to_rtc = request('internals.convert.data_to_rtc')
local compile_raw_data = request('!.concepts.codec_ds3231.compile')
local bytes_from_str = request('!.convert.bytes_from_str')

return
  function(me)
    local rtc_rec = data_to_rtc(me[1])
    local data_str = compile_raw_data(rtc_rec)
    me[2]:save(bytes_from_str(data_str))
  end

--[[
  2026 #
]]
