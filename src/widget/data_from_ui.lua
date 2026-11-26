-- Return RTC record according to GUI values

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

local get_moment = request('internals.convert.moment_page_to_data')
local get_alarm_1 = request('internals.convert.alarm_1_page_to_data')
local get_alarm_2 = request('internals.convert.alarm_2_page_to_data')
local get_core = request('internals.convert.core_page_to_data')
local merge_and_patch = request('!.table.merge_and_patch')

return
  function(me)
    local app = me[3]
    local ui_data =
      {
        Moment = get_moment(app),
        Alarm_1 = get_alarm_1(app),
        Alarm_2 = get_alarm_2(app),
        Core = get_core(app),
      }
    merge_and_patch(me[1], ui_data)
  end

--[[
  2020 #
  2026 # # #
]]
