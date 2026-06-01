-- Set UI moment's fields to current time

--[[
  Author: Martin Eden
  Last mod.: 2026-05-17
]]

-- Imports:
local merge_and_patch = request('!.table.merge_and_patch')

-- Weekday 1 from Lua's os.date() is Sunday. We want it to be Monday.
local adjust_luas_weekday =
  function(day)
    assert(day >= 1)

    day = day - 1
    if (day == 0) then
      day = 7
    end

    return day
  end

local create_moment_record =
  function(seconds)
    local Lua_DateTime = os.date('*t', seconds)

    local is_next_century = (Lua_DateTime.year >= 2100)
    local year = Lua_DateTime.year % 100

    local day = adjust_luas_weekday(Lua_DateTime.wday)

    return
      {
        is_next_century = is_next_century,
        year = year,
        month = Lua_DateTime.month,
        date = Lua_DateTime.day,
        day = day,
        hour = Lua_DateTime.hour,
        minute = Lua_DateTime.min,
        second = Lua_DateTime.sec,
      }
  end

local get_current_moment =
  function(OurData)
    local round_trip_time_sec = 2
    local cur_time = os.time() + round_trip_time_sec

    return create_moment_record(cur_time)
  end

-- Set current time
local func_set_cur_time =
  function(Me)
    local CurrentMoment = get_current_moment(UiData)
    merge_and_patch(Me.Data.Moment, CurrentMoment)
    -- Time is correct now, clear "bad time" flag
    Me.Data.Core.time_is_spoiled = false

    Me:DataToRaw()
    Me:DataToUi()
  end

-- Export:
return func_set_cur_time

--[[
  2019 #
  2022 #
  2026-04-27
  2026-04-28
  2026-05-10
  2026-05-11
  2026-05-17
]]
