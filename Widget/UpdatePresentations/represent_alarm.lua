-- Represent next alarm moment in human-friendly string

--[[
  Author: Martin Eden
  Last mod.: 2026-04-29
]]

-- Imports:
local glue_words = request('!.concepts.words.to_string')

local get_hms_str =
  function(Alarm, has_seconds)
    local Result = {}

    local hh = 'xx'
    if not Alarm.ignore_hour then
      hh = string.format('%02d', Alarm.hour)
    end
    table.insert(Result, hh)

    local mm = 'xx'
    if not Alarm.ignore_minute then
      mm = string.format('%02d', Alarm.minute)
    end
    table.insert(Result, mm)

    if has_seconds then
      local ss = 'xx'
      if not Alarm.ignore_second then
        ss = string.format('%02d', Alarm.second)
      end
      table.insert(Result, ss)
    end

    local result_str = table.concat(Result, ':')

    return result_str
  end

return
  function(Alarm)
    --[[
      One of the Alarm records don't have ".ignore_second" field.
    ]]

    local has_seconds = is_boolean(Alarm.ignore_second)

    local Result = {}

    table.insert(Result, 'at')

    if not Alarm.ignore_date_dow then
      local date_dow_str

      if Alarm.is_date_not_dow then
        table.insert(Result, 'day')
      else
        table.insert(Result, 'dow')
      end

      date_dow_str = string.format('%d,', Alarm.date_dow)

      table.insert(Result, date_dow_str)
    end

    table.insert(Result, get_hms_str(Alarm, has_seconds))

    return glue_words(Result)
  end

--[[
  2020 #
  2026-04-28
  2026-04-29
]]
