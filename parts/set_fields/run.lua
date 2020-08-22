--[[
  Set GUI values according to DS3231 state.
]]

local set_moment = request('set_moment')
local set_alarm_1 = request('set_alarm_1')
local set_alarm_2 = request('set_alarm_2')
local set_other = request('set_other')

return
  function(self, app, rtc_rec)
    assert_table(app)
    assert_table(rtc_rec)

    G_RAW_VALUES_LOAD = true

    set_moment(app, rtc_rec)
    set_alarm_1(app, rtc_rec)
    set_alarm_2(app, rtc_rec)
    set_other(app, rtc_rec)

    G_RAW_VALUES_LOAD = false

    self:update_presentations(app)
  end
