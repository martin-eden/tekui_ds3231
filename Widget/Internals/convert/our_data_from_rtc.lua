-- Convert DS3231 record to our custom data

--[[
  Author: Martin Eden
  Last mod.: 2026-05-13
]]

-- Imports:
local bcd_to_byte = request('!.convert.bcd_to_byte')
local get_bit = request('!.number.get_bit')
local get_bits = request('!.number.get_bits')
local from_ampm_hour = request('!.concepts.daytime.from_ampm_hour')

local get_hour =
  function(hour_data, is_12h_format)
    if is_12h_format then
      local is_pm = get_bit(hour_data, 5)
      local hour_ampm = bcd_to_byte(get_bits(hour_data, 0, 4))

      return from_ampm_hour(hour_ampm, is_pm)
    end

    return bcd_to_byte(hour_data)
  end

local get_temperature =
  function(TempRec)
    local int = TempRec.int
    local frac = TempRec.frac
    local is_neg = TempRec.is_neg

    local result
    result = int + frac / 4
    if is_neg then result = -result end

    return result
  end

local our_data_from_rtc =
  function(RtcRec)
    return
      {
        Core =
          {
            is_busy = RtcRec.Status.is_busy,
            time_is_spoiled = RtcRec.Status.time_is_spoiled,

            atbattery_clock_disabled = RtcRec.Status.atbattery_clock_disabled,
            atbattery_enable_wave = RtcRec.Status.atbattery_enable_wave,

            output_is_from_alarms = RtcRec.Status.output_is_from_alarms,
            enable_wave_32k = RtcRec.Status['32kihz_pin_enabled'],

            temperature = get_temperature(RtcRec.Status.Temperature),
            get_temperature = RtcRec.Status.getting_temperature,

            speed_trim = RtcRec.Status.speed_trim,

            wave_freq_num = RtcRec.Status.wave_freq_num,
          },
        Moment =
          {
            year = bcd_to_byte(RtcRec.Moment.year_bcd),
            is_next_century = RtcRec.Moment.is_next_century,

            month = bcd_to_byte(RtcRec.Moment.month_bcd),
            date = bcd_to_byte(RtcRec.Moment.date_bcd),
            day = bcd_to_byte(RtcRec.Moment.day_bcd),

            store_hour_in_12h = RtcRec.Moment.hour_is_12h_format,
            hour =
              get_hour(
                RtcRec.Moment.hour_data,
                RtcRec.Moment.hour_is_12h_format
              ),

            minute = bcd_to_byte(RtcRec.Moment.minute_bcd),
            second = bcd_to_byte(RtcRec.Moment.second_bcd),
          },
        Alarm_1 =
          {
            enabled = RtcRec.Status.alarm_1_enabled,
            occurred = RtcRec.Status.alarm_1_occurred,

            dateday = bcd_to_byte(RtcRec.Alarm_1.dateday_bcd),
            is_day = RtcRec.Alarm_1.dateday_is_day,
            ignore_dateday = RtcRec.Alarm_1.ignore_dateday,

            store_hour_in_12h = RtcRec.Alarm_1.hour_is_12h_format,
            hour =
              get_hour(
                RtcRec.Alarm_1.hour_data,
                RtcRec.Alarm_1.hour_is_12h_format
              ),
            ignore_hour = RtcRec.Alarm_1.ignore_hour,

            minute = bcd_to_byte(RtcRec.Alarm_1.minute_bcd),
            ignore_minute = RtcRec.Alarm_1.ignore_minute,

            second = bcd_to_byte(RtcRec.Alarm_1.second_bcd),
            ignore_second = RtcRec.Alarm_1.ignore_second,
          },
        Alarm_2 =
          {
            enabled = RtcRec.Status.alarm_2_enabled,
            occurred = RtcRec.Status.alarm_2_occurred,

            dateday = bcd_to_byte(RtcRec.Alarm_2.dateday_bcd),
            is_day = RtcRec.Alarm_2.dateday_is_day,
            ignore_dateday = RtcRec.Alarm_2.ignore_dateday,

            store_hour_in_12h = RtcRec.Alarm_1.hour_is_12h_format,
            hour =
              get_hour(
                RtcRec.Alarm_2.hour_data,
                RtcRec.Alarm_2.hour_is_12h_format
              ),
            ignore_hour = RtcRec.Alarm_2.ignore_hour,

            minute = bcd_to_byte(RtcRec.Alarm_2.minute_bcd),
            ignore_minute = RtcRec.Alarm_2.ignore_minute,
          },
      }
  end

-- Export:
return our_data_from_rtc

--[[
  2026-05-09
  2026-05-10
]]
