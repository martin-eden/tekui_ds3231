-- Set UI moment's fields to current time

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

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

local create_moment_record
do
  local os_date = os.date
  create_moment_record =
    function(seconds)
      local date_time_lua = os_date('*t', seconds)
      local is_next_century = (date_time_lua.year >= 2100)
      local year = date_time_lua.year % 100
      local day = adjust_luas_weekday(date_time_lua.wday)
      return
        {
          is_next_century = is_next_century,
          year = year,
          month = date_time_lua.month,
          date = date_time_lua.day,
          day = day,
          hour = date_time_lua.hour,
          minute = date_time_lua.min,
          second = date_time_lua.sec,
        }
    end
end

local get_current_moment
do
  local round_trip_time_sec = 2
  local os_time = os.time
  get_current_moment =
    function()
      return create_moment_record(os_time() + round_trip_time_sec)
    end
end

-- Export:
return
  function(me)
    local current_moment = get_current_moment()
    merge_and_patch(me[1].Moment, current_moment)
    me[1].Core.time_is_spoiled = false
    me:data_to_raw()
    me:data_to_ui()
  end

--[[
  2019 #
  2022 #
  2026 # # # # #
]]
