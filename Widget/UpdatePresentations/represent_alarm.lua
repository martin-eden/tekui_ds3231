-- Represent next alarm moment in human-friendly string

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local glue_words = request('!.concepts.words.to_string')

return
  function(Alarm)
    --[[
      One of the Alarm records don't have ".ignore_second" field.
    ]]

    local has_seconds = is_boolean(Alarm.ignore_second)

    local all_ignored =
      Alarm.ignore_date_dow and
      Alarm.ignore_hour and
      Alarm.ignore_minute and
      (
        not Alarm.has_seconds or
        (Alarm.has_seconds and Alarm.ignore_second)
      )

    if all_ignored then
      if has_seconds then
        return 'at next second'
      else
        return 'at next minute'
      end
    end

    local Result = {}

    table.insert(Result, 'at')

    if not Alarm.ignore_date_dow then
      if Alarm.is_date_not_dow then
        table.insert(Result, string.format('day %d,', Alarm.date_dow))
      else
        table.insert(Result, string.format('dow %d,', Alarm.date_dow))
      end
    end
    if not Alarm.ignore_hour then
      table.insert(Result, string.format('%02dh', Alarm.hour))
    end
    if not Alarm.ignore_minute then
      table.insert(Result, string.format('%02dm', Alarm.minute))
    end
    if has_seconds and not Alarm.ignore_second then
      table.insert(Result, string.format('%02ds', Alarm.second))
    end

    return glue_words(Result)
  end

--[[
  2020 #
  2026-04-28
]]
