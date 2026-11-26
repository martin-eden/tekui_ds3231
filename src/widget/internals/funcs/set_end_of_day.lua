-- Set moment's fields to end of day. Useful for testing

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

return
  function(me)
    local our_data = me[1]
    our_data.Moment.hour = 23
    our_data.Moment.minute = 59
    our_data.Moment.second = 59
    me:data_to_raw()
    me:data_to_ui()
  end

--[[
  2026 # #
]]
