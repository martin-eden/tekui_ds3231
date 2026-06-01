-- Format integer (0..99) as string with two digits

--[[
  Author: Martin Eden
  Last mod.: 2026-05-09
]]

local to_two_digits_str =
  function(n)
    return string.format('%02d', n)
  end

-- Export:
return to_two_digits_str

--[[
  2026-05-09
]]
