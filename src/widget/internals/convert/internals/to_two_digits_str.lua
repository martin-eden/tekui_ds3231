-- Format integer (0..99) as string with two digits

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local str_format = string.format

return
  function(n)
    return str_format('%02d', n)
  end

--[[
  2026 #
]]
