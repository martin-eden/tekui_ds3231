local compile_rtc = request('!.concepts.rtc_ds3231.compile')
local t2s = request('!.table.as_string')
local s2f = request('!.string.save_to_file')

return
  function(self, parsed_rtc)
    self.raw_rtc = compile_rtc(parsed_rtc)

    s2f('parts/illusive_rtc_handler/default_raw_state.lua', t2s(self.raw_rtc))

    local rtc_str = t2s(parsed_rtc)
    s2f('parts/illusive_rtc_handler/default_rtc_state.lua', rtc_str)
  end
