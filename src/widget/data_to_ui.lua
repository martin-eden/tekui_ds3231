-- Set GUI values according to RTC record

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

local set_moment = request('internals.convert.moment_page_from_data')
local set_alarm_1 = request('internals.convert.alarm_1_page_from_data')
local set_alarm_2 = request('internals.convert.alarm_2_page_from_data')
local set_core = request('internals.convert.core_page_from_data')

return
  function(me)
    local app = me[3]
    local our_data = me[1]

    _G.is_loading_raw_data = true

    set_moment(app, our_data.Moment)
    set_alarm_1(app, our_data.Alarm_1)
    set_alarm_2(app, our_data.Alarm_2)
    set_core(app, our_data.Core)

    _G.is_loading_raw_data = false

    me:update_presentations()
  end

--[[
  2020 #
  2026 # # #
]]
