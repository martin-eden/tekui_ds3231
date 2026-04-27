--Represent time moment in human-friendly string

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

local WeekdayNames_Map =
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
  function(Rtc_Rec)
    local Moment = Rtc_Rec.moment

    return
      string.format(
        '%04d-%02d-%02d (%s) %02d:%02d:%02d',
        Moment.year,
        Moment.month,
        Moment.date,
        WeekdayNames_Map[Moment.dow],
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
