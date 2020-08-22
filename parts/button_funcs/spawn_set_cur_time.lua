local merge = request('!.table.merge')

local to_rtc_time =
  function(lua_time)
    local dow = (lua_time.wday + 6) % 7
    if (dow == 0) then
      dow = 7
    end
    return
      {
        year = lua_time.year,
        month = lua_time.month,
        dow = dow,
        date = lua_time.day,
        hour = lua_time.hour,
        minute = lua_time.min,
        second = lua_time.sec,
      }
  end

local set_cur_moment =
  function(rtc_rec)
    local round_trip_time_sec = 2
    local cur_time = os.time() + round_trip_time_sec
    local cur_time_table = os.date('*t', cur_time)
    merge(rtc_rec.moment, to_rtc_time(cur_time_table))
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
