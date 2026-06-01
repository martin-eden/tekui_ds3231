-- Represent "core" page fields in human-friendly string

--[[
  Author: Martin Eden
  Last mod.: 2026-05-11
]]

-- Imports:
local add_to_list = request('!.concepts.list.add_item')
local glue_words = request('!.concepts.words.to_string')

local WaveFreqNumToStr =
  {
    [0] = '1 Hz',
    [1] = '1 KiHz',
    [2] = '4 KiHz',
    [3] = '8 KiHz',
  }

local represent_wave_freq =
  function(wave_freq_num)
    return string.format('[%s]', WaveFreqNumToStr[wave_freq_num])
  end

local represent_core =
  function(Core)
    local Result = { }

    if Core.enable_wave_32k then
      add_to_list(Result, '[32 KiHz]')
    end

    if Core.output_is_from_alarms then
      add_to_list(Result, '[alarms]')
    else
      add_to_list(Result, represent_wave_freq(Core.wave_freq_num))
    end

    if Core.time_is_spoiled then
      add_to_list(Result, '[incorrect time]')
    end

    add_to_list(Result, string.format('[%.2f °C]', Core.temperature))

    return glue_words(Result)
  end

-- Export:
return represent_core

--[[
  2020 #
  2026-04-28
]]
