local dow_names = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'}

return
  function(rtc_rec)
    local moment = rtc_rec.moment
    local dow_name = dow_names[moment.dow]
    assert_string(dow_name)
    return
      ('%04d-%02d-%02d %02d:%02d:%02d (%s)'):
      format(
        moment.year,
        moment.month,
        moment.date,
        moment.hour,
        moment.minute,
        moment.second,
        dow_name
      )
  end
