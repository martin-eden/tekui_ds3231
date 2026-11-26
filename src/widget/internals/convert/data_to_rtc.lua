-- Convert our custom data to DS3231 record

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local bcd_from_byte = request('!.convert.bcd_from_byte')

local get_hour_data_from_hour
do
  local to_ampm_hour = request('!.concepts.daytime.to_ampm_hour')
  local set_bit = request('!.number.set_bit')
  local set_bits = request('!.number.set_bits')
  get_hour_data_from_hour =
    function(hour, is_ampm)
      local hour_data = 0
      if is_ampm then
        local hour_ampm, is_pm = to_ampm_hour(hour)
        hour_data = bcd_from_byte(set_bits(hour_ampm, 0, 4, hour_data))
        hour_data = set_bit(hour_data, 5, is_pm)
      else
        hour_data = bcd_from_byte(hour)
      end
      return hour_data
    end
end

local set_temperature
do
  local modf = math.modf
  local tointeger = math.tointeger
  set_temperature =
    function(temperature)
      -- Round to quarters:
      temperature = modf(temperature * 4) / 4

      local temp_rec = { int = 0, frac = 0, is_neg = false }

      if (temperature < 0) then
        temp_rec.is_neg = true
        temperature = temperature + 128
      end

      local int_part, frac_part = modf(temperature)

      temp_rec.int = tointeger(int_part)
      temp_rec.frac = tointeger(4 * frac_part)

      return temp_rec
    end
end

-- Export:
return
  function(our_data)
    return
      {
        status =
          {
            alarm_1_enabled = our_data.Alarm_1.enabled,
            alarm_1_occurred = our_data.Alarm_1.occurred,
            alarm_2_enabled = our_data.Alarm_2.enabled,
            alarm_2_occurred = our_data.Alarm_2.occurred,
            is_busy = our_data.Core.is_busy,
            time_is_spoiled = our_data.Core.time_is_spoiled,
            atbattery_clock_disabled = our_data.Core.atbattery_clock_disabled,
            atbattery_enable_wave = our_data.Core.atbattery_enable_wave,
            output_is_from_alarms = our_data.Core.output_is_from_alarms,
            ['32kihz_pin_enabled'] = our_data.Core.enable_wave_32k,
            temperature = set_temperature(our_data.Core.temperature),
            getting_temperature = our_data.Core.get_temperature,
            speed_trim = our_data.Core.speed_trim,
            wave_freq_num = our_data.Core.wave_freq_num,
          },
        moment =
          {
            year_bcd = bcd_from_byte(our_data.Moment.year),
            is_next_century = our_data.Moment.is_next_century,
            month_bcd = bcd_from_byte(our_data.Moment.month),
            date_bcd = bcd_from_byte(our_data.Moment.date),
            day_bcd = bcd_from_byte(our_data.Moment.day),
            hour_is_12h_format = our_data.Moment.store_hour_in_12h,
            hour_data =
              get_hour_data_from_hour(
                our_data.Moment.hour,
                our_data.Moment.store_hour_in_12h
              ),
            minute_bcd = bcd_from_byte(our_data.Moment.minute),
            second_bcd = bcd_from_byte(our_data.Moment.second),
          },
        alarm_1 =
          {
            dateday_bcd = bcd_from_byte(our_data.Alarm_1.dateday),
            dateday_is_day = our_data.Alarm_1.is_day,
            ignore_dateday = our_data.Alarm_1.ignore_dateday,
            hour_is_12h_format = our_data.Alarm_1.store_hour_in_12h,
            hour_data =
              get_hour_data_from_hour(
                our_data.Alarm_1.hour,
                our_data.Alarm_1.store_hour_in_12h
              ),
            ignore_hour = our_data.Alarm_1.ignore_hour,
            minute_bcd = bcd_from_byte(our_data.Alarm_1.minute),
            ignore_minute = our_data.Alarm_1.ignore_minute,
            second_bcd = bcd_from_byte(our_data.Alarm_1.second),
            ignore_second = our_data.Alarm_1.ignore_second,
          },
        alarm_2 =
          {
            dateday_bcd = bcd_from_byte(our_data.Alarm_2.dateday),
            dateday_is_day = our_data.Alarm_2.is_day,
            ignore_dateday = our_data.Alarm_2.ignore_dateday,
            hour_is_12h_format = our_data.Alarm_2.store_hour_in_12h,
            hour_data =
              get_hour_data_from_hour(
                our_data.Alarm_2.hour,
                our_data.Alarm_2.store_hour_in_12h
              ),
            ignore_hour = our_data.Alarm_2.ignore_hour,
            minute_bcd = bcd_from_byte(our_data.Alarm_2.minute),
            ignore_minute = our_data.Alarm_2.ignore_minute,
          },
      }
  end

--[[
  2026 # # # #
]]
