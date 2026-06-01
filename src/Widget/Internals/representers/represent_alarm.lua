-- Represent next alarm moment in human-friendly string

--[[
  Author: Martin Eden
  Last mod.: 2026-05-18
]]

-- Imports:
local add_to_list = request('!.concepts.list.add_item')
local glue_words = request('!.concepts.words.to_string')

local get_hms_str =
  function(Alarm, has_seconds)
    local Result = { }

    local hh = 'xx'
    if not Alarm.ignore_hour then
      hh = string.format('%02d', Alarm.hour)
    end
    add_to_list(Result, hh)

    local mm = 'xx'
    if not Alarm.ignore_minute then
      mm = string.format('%02d', Alarm.minute)
    end
    add_to_list(Result, mm)

    if has_seconds then
      local ss = 'xx'
      if not Alarm.ignore_second then
        ss = string.format('%02d', Alarm.second)
      end
      add_to_list(Result, ss)
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

    local Result = { }

    if Alarm.occurred then
      add_to_list(Result, '[x]')
    else
      add_to_list(Result, '[·]')
    end

    add_to_list(Result, 'at')

    if not Alarm.ignore_dateday then
      if Alarm.is_day then
        add_to_list(Result, 'day')
      else
        add_to_list(Result, 'date')
      end

      add_to_list(Result, string.format('%d,', Alarm.dateday))
    end

    add_to_list(Result, get_hms_str(Alarm, has_seconds))

    return glue_words(Result)
  end

--[[
  2020 #
  2026-04-28
  2026-04-29
  2026-05-18
]]
