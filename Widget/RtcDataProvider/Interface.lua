-- Interface for RTC data record provider

--[[
  Author: Martin Eden
  Last mod.: 2026-04-29
]]

-- Imports:
local parse_rtc = request('!.concepts.rtc_ds3231.parse')
local compile_rtc = request('!.concepts.rtc_ds3231.compile')

local Load =
  function(Me)
    local RawData = Me.RawDataProvider:Load()

    if not RawData then
      return false
    end

    return parse_rtc(RawData)
  end

local Save =
  function(Me, RtcRec)
    local RawData = compile_rtc(RtcRec)
    Me.RawDataProvider:Save(RawData)
  end

-- Export:
return
  {
    -- Config:
    RawDataProvider = request('^.RawDataProvider.Interface'),

    -- Main:
    Load = Load,
    Save = Save,
  }

--[[
  2026-04-28
  2026-04-29
]]
