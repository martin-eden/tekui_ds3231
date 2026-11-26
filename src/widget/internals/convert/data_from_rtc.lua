-- Convert DS3231 record to our custom data

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local bcd_to_byte = request('!.convert.bcd_to_byte')

local get_hour
do
  local get_bit = request('!.number.get_bit')
  local get_bits = request('!.number.get_bits')
  local from_ampm_hour = request('!.concepts.daytime.from_ampm_hour')
  get_hour =
    function(hour_data, is_12h_format)
      if is_12h_format then
        local is_pm = get_bit(hour_data, 5)
        local hour_ampm = bcd_to_byte(get_bits(hour_data, 0, 4))
        return from_ampm_hour(hour_ampm, is_pm)
      end
      return bcd_to_byte(hour_data)
    end
end

local get_temperature =
  function(temp_rec)
    local temperature = temp_rec.int + temp_rec.frac / 4
    if temp_rec.is_neg then
      temperature = temperature - 128
    end
    return temperature
  end

-- Export:
return
  function(rtc_rec)
    return
      {
        Core =
          {
            is_busy = rtc_rec.status.is_busy,
            time_is_spoiled = rtc_rec.status.time_is_spoiled,
            atbattery_clock_disabled = rtc_rec.status.atbattery_clock_disabled,
            atbattery_enable_wave = rtc_rec.status.atbattery_enable_wave,
            output_is_from_alarms = rtc_rec.status.output_is_from_alarms,
            enable_wave_32k = rtc_rec.status['32kihz_pin_enabled'],
            temperature = get_temperature(rtc_rec.status.temperature),
            get_temperature = rtc_rec.status.getting_temperature,
            speed_trim = rtc_rec.status.speed_trim,
            wave_freq_num = rtc_rec.status.wave_freq_num,
          },
        Moment =
          {
            year = bcd_to_byte(rtc_rec.moment.year_bcd),
            is_next_century = rtc_rec.moment.is_next_century,
            month = bcd_to_byte(rtc_rec.moment.month_bcd),
            date = bcd_to_byte(rtc_rec.moment.date_bcd),
            day = bcd_to_byte(rtc_rec.moment.day_bcd),
            store_hour_in_12h = rtc_rec.moment.hour_is_12h_format,
            hour =
              get_hour(
                rtc_rec.moment.hour_data,
                rtc_rec.moment.hour_is_12h_format
              ),
            minute = bcd_to_byte(rtc_rec.moment.minute_bcd),
            second = bcd_to_byte(rtc_rec.moment.second_bcd),
          },
        Alarm_1 =
          {
            enabled = rtc_rec.status.alarm_1_enabled,
            occurred = rtc_rec.status.alarm_1_occurred,
            dateday = bcd_to_byte(rtc_rec.alarm_1.dateday_bcd),
            is_day = rtc_rec.alarm_1.dateday_is_day,
            ignore_dateday = rtc_rec.alarm_1.ignore_dateday,
            store_hour_in_12h = rtc_rec.alarm_1.hour_is_12h_format,
            hour =
              get_hour(
                rtc_rec.alarm_1.hour_data,
                rtc_rec.alarm_1.hour_is_12h_format
              ),
            ignore_hour = rtc_rec.alarm_1.ignore_hour,
            minute = bcd_to_byte(rtc_rec.alarm_1.minute_bcd),
            ignore_minute = rtc_rec.alarm_1.ignore_minute,
            second = bcd_to_byte(rtc_rec.alarm_1.second_bcd),
            ignore_second = rtc_rec.alarm_1.ignore_second,
          },
        Alarm_2 =
          {
            enabled = rtc_rec.status.alarm_2_enabled,
            occurred = rtc_rec.status.alarm_2_occurred,
            dateday = bcd_to_byte(rtc_rec.alarm_2.dateday_bcd),
            is_day = rtc_rec.alarm_2.dateday_is_day,
            ignore_dateday = rtc_rec.alarm_2.ignore_dateday,
            store_hour_in_12h = rtc_rec.alarm_1.hour_is_12h_format,
            hour =
              get_hour(
                rtc_rec.alarm_2.hour_data,
                rtc_rec.alarm_2.hour_is_12h_format
              ),
            ignore_hour = rtc_rec.alarm_2.ignore_hour,
            minute = bcd_to_byte(rtc_rec.alarm_2.minute_bcd),
            ignore_minute = rtc_rec.alarm_2.ignore_minute,
          },
      }
  end

--[[
  2026 # # #
]]
