-- Represent "other" page fields in human-friendly string

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local glue_words = request('!.concepts.words.to_string')

local represent_misc_fields =
  function(Rtc_Rec)
    local Result = {}

    table.insert(Result, string.format('[%.2f °C]', Rtc_Rec.temperature))

    if Rtc_Rec.output_alarms_not_wave then
      table.insert(Result, '[alarms]')
    else
      table.insert(Result, string.format('[%d Hz]', Rtc_Rec.wave_freq))
    end

    if Rtc_Rec.enable_wave_32k then
      table.insert(Result, '[32 KiHz]')
    end

    if Rtc_Rec.at_battery.clock_was_stopped then
      table.insert(Result, '[incorrect time]')
    end

    return glue_words(Result)
  end

-- Export:
return represent_misc_fields

--[[
  2020 #
  2026-04-28
]]
