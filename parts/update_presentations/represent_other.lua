--[[
  Represent "other" page fields in human-friendly string.
]]

return
  function(rtc_rec)
    local result = ''

    result = result .. ('[%.2f °C]'):format(rtc_rec.temperature)

    result = result .. ' ['
    if rtc_rec.output_alarms_not_wave then
      result = result .. 'alarms'
    else
      result = result .. ('%d Hz'):format(rtc_rec.wave_freq)
    end
    result = result .. ']'

    if rtc_rec.enable_wave_32k then
      result = result .. ' [32768 Hz]'
    end

    if rtc_rec.at_battery.clock_was_stopped then
      result = result .. ' [incorrect time]'
    end

    return result
  end
