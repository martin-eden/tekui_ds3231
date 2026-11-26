--Represent time moment in human-friendly string

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local daynum_name =
  {
    [1] = 'Mon',
    [2] = 'Tue',
    [3] = 'Wed',
    [4] = 'Thu',
    [5] = 'Fri',
    [6] = 'Sat',
    [7] = 'Sun',
  }

local str_format = string.format

return
  function(moment)
    local year = moment.year + 2000
    if moment.is_next_century then
      year = year + 100
    end
    return
      str_format(
        '%04d-%02d-%02d (%s) %02d:%02d:%02d',
        year,
        moment.month,
        moment.date,
        daynum_name[moment.day],
        moment.hour,
        moment.minute,
        moment.second
      )
  end

--[[
  2019 #
  2020 #
  2024 #
]]
