--[[
  Represent next alarm moment in human-friendly string.
]]

local rtrim = request('!.string.trim_tail')

return
  function(alarm)
    local result = 'at '

    if not alarm.ignore_date_dow then
      if alarm.is_date_not_dow then
        result = result .. ('day %d, '):format(alarm.date_dow)
      else
        result = result .. ('dow %d, '):format(alarm.date_dow)
      end
    end
    if not alarm.ignore_hour then
      result = result .. ('%02dh '):format(alarm.hour)
    end
    if not alarm.ignore_minute then
      result = result .. ('%02dm '):format(alarm.minute)
    end
    if is_boolean(alarm.ignore_second) and not alarm.ignore_second then
      result = result .. ('%02ds '):format(alarm.second)
    end
    result = rtrim(result)

    --[[
      Sorry for side effect usage. Intention is to detect that
      time is not specified, so alarm will start at next minute
      or second.
    ]]
    if (result == 'at') then
      result = 'at next '
      if is_boolean(alarm.ignore_second) then
        result = result .. 'second'
      else
        result = result .. 'minute'
      end
    end

    return result
  end
