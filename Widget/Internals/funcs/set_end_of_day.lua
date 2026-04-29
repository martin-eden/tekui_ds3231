-- Set moment's fields to end of day. Useful for testing

--[[
  Author: Martin Eden
  Last mod.: 2026-05-11
]]

-- Imports:

local set_end_of_day =
  function(Me)
    local OurData = Me.Data

    OurData.Moment.hour = 23
    OurData.Moment.minute = 59
    OurData.Moment.second = 59

    Me:DataToUi()
  end

-- Export:
return set_end_of_day

--[[
  2026-05-11
]]
