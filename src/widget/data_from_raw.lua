-- Load data from data provider, parse and store it

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

local bytes_to_str = request('!.convert.bytes_to_str')
local parse_raw_data = request('!.concepts.codec_ds3231.parse')
local data_from_rtc = request('internals.convert.data_from_rtc')

return
  function(me)
    local raw_data = me[2]:load()
    if (#raw_data == 0) then return end
    local rtc_rec = parse_raw_data(bytes_to_str(raw_data))
    me[1] = data_from_rtc(rtc_rec)
  end

--[[
  2026 # #
]]
