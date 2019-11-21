local spawn_set_presentation = request('spawn_set_presentation')
local represent_recurrence = request('represent_recurrence')

local getter =
  function(rtc_rec)
    return represent_recurrence(rtc_rec.alarm[2])
  end

return spawn_set_presentation('alarm_2_presentation', getter)
