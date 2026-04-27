-- Save current time to device

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local merge_and_patch = request('!.table.merge_and_patch')

-- Weekday 1 from Lua's os.date() is Sunday. We want it to be Monday.
local adjust_luas_weekday =
  function(dow)
    assert(dow >= 1)

    dow = dow - 1
    if (dow == 0) then
      dow = 7
    end

    return dow
  end

local create_moment_record =
  function(cur_time)
    local Lua_DateTime = os.date('*t', cur_time)

    local dow = adjust_luas_weekday(Lua_DateTime.wday)

    return
      {
        year = Lua_DateTime.year,
        month = Lua_DateTime.month,
        dow = dow,
        date = Lua_DateTime.day,
        hour = Lua_DateTime.hour,
        minute = Lua_DateTime.min,
        second = Lua_DateTime.sec,
      }
  end

local set_current_moment =
  function(Rtc_Rec)
    local round_trip_time_sec = 2
    local cur_time = os.time() + round_trip_time_sec

    local Moment = create_moment_record(cur_time)

    merge_and_patch(Rtc_Rec.moment, Moment)

    -- Time is correct now, clear "bad time" flag
    Rtc_Rec.at_battery.clock_was_stopped = false
  end

-- Set current time
local func_set_cur_time =
  function(Me, TekUi_App)
    local Gui_Rtc_Rec = Me:GetFields(TekUi_App)
    set_current_moment(Gui_Rtc_Rec)
    Me.RtcDataProvider:Save(Gui_Rtc_Rec)
    Me:SetFields(TekUi_App, Me.RtcDataProvider:Load())
  end

-- Export:
return func_set_cur_time

--[[
  2019 #
  2022 #
  2026-04-27
  2026-04-28
]]
