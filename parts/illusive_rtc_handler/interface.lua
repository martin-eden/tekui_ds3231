return
  {
    tty_name = 'illusive DS3231',
    init = request('init'),
    load_rtc = request('load_rtc'),
    save_rtc = request('save_rtc'),
    --
    raw_rtc = request('default_raw_state'),
    rtc = request('default_rtc_state'),
  }
