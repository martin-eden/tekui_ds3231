--[[
  Set DS3231 state according to GUI values.
]]

local merge = request('!.table.merge')

local get_moment = request('get_moment')
local get_alarm_1 = request('get_alarm_1')
local get_alarm_2 = request('get_alarm_2')
local get_other = request('get_other')

return
  function(self, app)
    assert_table(app)

    local result = {}
    merge(result, get_moment(app))
    merge(result, get_alarm_1(app))
    merge(result, get_alarm_2(app))
    merge(result, get_other(app))

    return result
  end
