-- local hex_dump = request('!.string.get_hex_dump')

return
  function(self)
    local max_chunk_size = 16
    local s = self.f_in:read(max_chunk_size)
    if (s == '') then
      s = nil
    end
    if s then
      self.data_concatter:add(s)
      -- print(('| %s | %s |'):format(hex_dump(s), s))
    end
    return s
  end
