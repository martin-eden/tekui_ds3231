local represent_alarm = request('represent_alarm')

return
  function(rtc_rec)
    return represent_alarm(rtc_rec.alarm_2)
  end
