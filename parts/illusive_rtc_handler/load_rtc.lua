local parse_rtc = request('!.concepts.rtc_ds3231.parse')

return
  function(self)
    self.rtc = parse_rtc(self.raw_rtc)
    return self.rtc
  end
