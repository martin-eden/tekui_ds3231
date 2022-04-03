local merge = request('!.table.merge')

local create_moment_record =
  function(cur_time)
    local lua_time_tbl = os.date('*t', cur_time)

    -- <.wday> == 1 is Sunday. We want 1 to be Monday.\
    local dow = lua_time_tbl.wday
    assert(dow >= 1)
    dow = dow - 1
    if (dow == 0) then
      dow = 7
    end

    return
      {
        year = lua_time_tbl.year,
        month = lua_time_tbl.month,
        dow = dow,
        date = lua_time_tbl.day,
        hour = lua_time_tbl.hour,
        minute = lua_time_tbl.min,
        second = lua_time_tbl.sec,
      }
  end

local set_cur_moment =
  function(rtc_rec)
    local round_trip_time_sec = 2
    local cur_time = os.time() + round_trip_time_sec

    local moment = create_moment_record(cur_time)

    merge(rtc_rec.moment, moment)
    rtc_rec.at_battery.clock_was_stopped = false
  end

return
  function(self)
    return
      function(app)
        local parsed_rtc = self:get_fields(app)
        set_cur_moment(parsed_rtc)
        self.rtc_handler:save_rtc(parsed_rtc)
        self:set_fields(app, self.rtc_handler:load_rtc())
      end
  end
