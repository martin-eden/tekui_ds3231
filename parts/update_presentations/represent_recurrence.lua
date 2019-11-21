local multiplicity_to_period =
  request('!.formats.ds3231.multiplicity_to_period')

local period_abbrevs =
  {
    month = 'M',
    week = 'W',
    day = 'D',
    hour = 'H',
    minute = 'M',
    second = 'S',
  }

local assert_period =
  function(period)
    assert_string(period)
    assert(period_abbrevs[period])
  end

local get_time_offs_str =
  function(offset)
    local result
    result = ('%02d:%02d'):format(offset.hour or 0, offset.minute or 0)
    if offset.second then
      result = result .. (':%02d'):format(offset.second)
    end
    return result
  end

return
  function(alarm_rec)
    local recurrence = multiplicity_to_period(alarm_rec)

    assert_table(recurrence)
    assert_period(recurrence.period)

    local offset = recurrence.offset

    local result = ''

    if (recurrence.period == 'month') then
      result = result .. ('%02dT'):format(offset.date)
    elseif (recurrence.period == 'week') then
      result = result .. ('%01dT'):format(offset.dow)
    end
    result = result .. get_time_offs_str(recurrence.offset)

    result =
      result .. ('/P1%s'):format(period_abbrevs[recurrence.period])

    return result
  end
