--Represent time moment in human-friendly string

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

local DayNumToName =
  {
    [1] = 'Mon',
    [2] = 'Tue',
    [3] = 'Wed',
    [4] = 'Thu',
    [5] = 'Fri',
    [6] = 'Sat',
    [7] = 'Sun',
  }

local represent_moment =
  function(Moment)
    local year = Moment.year + 2000
    if Moment.is_next_century then
      year = year + 100
    end

    return
      string.format(
        '%04d-%02d-%02d (%s) %02d:%02d:%02d',
        year,
        Moment.month,
        Moment.date,
        DayNumToName[Moment.dow],
        Moment.hour,
        Moment.minute,
        Moment.second
      )
  end

-- Export:
return represent_moment

--[[
  2019 #
  2020 #
  2024-04-28
]]
