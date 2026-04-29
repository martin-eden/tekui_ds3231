-- Convert our custom data to DS3231 record

--[[
  Author: Martin Eden
  Last mod.: 2026-05-11
]]

-- Imports:
local bcd_from_byte = request('!.convert.bcd_from_byte')
local to_ampm_hour = request('!.concepts.daytime.to_ampm_hour')
local set_bit = request('!.number.set_bit')
local set_bits = request('!.number.set_bits')
local constrain_number = request('!.number.constrain')

local get_hour_data_from_hour =
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

local set_temperature =
  function(temperature)
    temperature = constrain_number(temperature, -128, 127.75)

    -- Round to quarters:
    temperature = math.modf(temperature * 4) / 4

    local TempRec =
      {
        int = 0,
        frac = 0,
        is_neg = false,
      }

    if (temperature < 0) then
      TempRec.is_neg = true

      temperature = -temperature
    end

    local int_part, frac_part = math.modf(temperature)

    TempRec.int = math.tointeger(int_part)

    TempRec.frac = math.tointeger(4 * frac_part)

    return TempRec
  end

local our_data_to_rtc =
  function(OurData)
    return
      {
        Status =
          {
            alarm_1_enabled = OurData.Alarm_1.enabled,
            alarm_1_occurred = OurData.Alarm_1.occurred,

            alarm_2_enabled = OurData.Alarm_2.enabled,
            alarm_2_occurred = OurData.Alarm_2.occurred,

            is_busy = OurData.Core.is_busy,
            time_is_spoiled = OurData.Core.time_is_spoiled,

            atbattery_clock_disabled = OurData.Core.atbattery_clock_disabled,
            atbattery_enable_wave = OurData.Core.atbattery_enable_wave,

            output_is_from_alarms = OurData.Core.output_is_from_alarms,
            ['32kihz_pin_enabled'] = OurData.Core.enable_wave_32k,

            Temperature = set_temperature(OurData.Core.temperature),
            getting_temperature = OurData.Core.get_temperature,

            speed_trim = OurData.Core.speed_trim,

            wave_freq_num = OurData.Core.wave_freq_num,
          },
        Moment =
          {
            year_bcd = bcd_from_byte(OurData.Moment.year),
            is_next_century = OurData.Moment.is_next_century,

            month_bcd = bcd_from_byte(OurData.Moment.month),
            date_bcd = bcd_from_byte(OurData.Moment.date),
            day_bcd = bcd_from_byte(OurData.Moment.day),

            hour_is_12h_format = OurData.Moment.store_hour_in_12h,
            hour_data =
              get_hour_data_from_hour(
                OurData.Moment.hour,
                OurData.Moment.store_hour_in_12h
              ),

            minute_bcd = bcd_from_byte(OurData.Moment.minute),
            second_bcd = bcd_from_byte(OurData.Moment.second),
          },
        Alarm_1 =
          {
            dateday_bcd = bcd_from_byte(OurData.Alarm_1.dateday),
            dateday_is_day = OurData.Alarm_1.is_day,
            ignore_dateday = OurData.Alarm_1.ignore_dateday,

            hour_is_12h_format = OurData.Alarm_1.store_hour_in_12h,
            hour_data =
              get_hour_data_from_hour(
                OurData.Alarm_1.hour,
                OurData.Alarm_1.store_hour_in_12h
              ),
            ignore_hour = OurData.Alarm_1.ignore_hour,

            minute_bcd = bcd_from_byte(OurData.Alarm_1.minute),
            ignore_minute = OurData.Alarm_1.ignore_minute,

            second_bcd = bcd_from_byte(OurData.Alarm_1.second),
            ignore_second = OurData.Alarm_1.ignore_second,
          },
        Alarm_2 =
          {
            dateday_bcd = bcd_from_byte(OurData.Alarm_2.dateday),
            dateday_is_day = OurData.Alarm_2.is_day,
            ignore_dateday = OurData.Alarm_2.ignore_dateday,

            hour_is_12h_format = OurData.Alarm_2.store_hour_in_12h,
            hour_data =
              get_hour_data_from_hour(
                OurData.Alarm_2.hour,
                OurData.Alarm_2.store_hour_in_12h
              ),
            ignore_hour = OurData.Alarm_2.ignore_hour,

            minute_bcd = bcd_from_byte(OurData.Alarm_2.minute),
            ignore_minute = OurData.Alarm_2.ignore_minute,
          },
      }
  end

-- Export:
return our_data_to_rtc

--[[
  2026-05-09
  2026-05-10
  2026-05-11
]]
