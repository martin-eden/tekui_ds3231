-- Represent "core" page fields in human-friendly string

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local str_format = string.format

local represent_wave_freq
do
  local wavenum_to_str =
    {
      [0] = '1 Hz',
      [1] = '1 KiHz',
      [2] = '4 KiHz',
      [3] = '8 KiHz',
    }
  represent_wave_freq =
    function(wave_num)
      return str_format('[%s]', wavenum_to_str[wave_num])
    end
end

local add_to_list = request('!.concepts.list.add_item')
local glue_words = request('!.concepts.words.to_string')

return
  function(core)
    local result = { }

    if core.enable_wave_32k then
      add_to_list(result, '[32 KiHz]')
    end

    if core.output_is_from_alarms then
      add_to_list(result, '[alarms]')
    else
      add_to_list(result, represent_wave_freq(core.wave_freq_num))
    end

    if core.time_is_spoiled then
      add_to_list(result, '[incorrect time]')
    end

    add_to_list(result, str_format('[%.2f °C]', core.temperature))

    return glue_words(result)
  end

--[[
  2020 #
  2026 #
]]
