-- local t2s = request('!.table.as_string')
local parse_rtc = request('!.formats.ds3231.parse')

return
  function(self)
    self.compiler.request.i2c_read(self.compiler, 0x68, 0, 0x13)

    while self:get_next_chunk() do
    end

    local records, status = self.parser:parse()
    if (#records > 0) then
      for _, rec in ipairs(records) do
        -- print(t2s(rec))
        if
          (rec.type == 'i2c_reply') and
          (rec.device_id == 0x68)
        then
          local result = parse_rtc(rec.data)
          -- print(t2s(result))
          return result
        end
      end
    end
  end
