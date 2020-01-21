-- local t2s = request('!.table.as_string')
-- local dump_bits = request('!.frontend.text.dump_bits')
local compile_rtc = request('!.formats.ds3231.compile')

return
  function(self, parsed_rtc)
    -- print(t2s(parsed_rtc))
    local raw_rtc = compile_rtc(parsed_rtc)
    -- print(t2s(raw_rtc))
    -- print(dump_bits(raw_rtc, 0))
    self.compiler.request.i2c_write(
      self.compiler,
      0x68,
      0,
      table.unpack(raw_rtc, 0, #raw_rtc - 1)
    )
  end
