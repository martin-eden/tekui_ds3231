return
  function(self)
    local max_chunk_size = 128
    local s = self.f_in:read(max_chunk_size)
    if (s == '') then
      s = nil
    end
    if s then
      self.data_concatter:add(s)
      -- print(s)
    end
    return s
  end
