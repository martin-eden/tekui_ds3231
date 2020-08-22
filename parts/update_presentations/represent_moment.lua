--[[
  Represent time moment in human-friendly string.
]]

local dow_names = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'}

return
  function(rtc_rec)
    local moment = rtc_rec.moment
    return
      ('%04d-%02d-%02d (%s) %02d:%02d:%02d'):
      format(
        moment.year,
        moment.month,
        moment.date,
        dow_names[moment.dow],
        moment.hour,
        moment.minute,
        moment.second
      )
  end
