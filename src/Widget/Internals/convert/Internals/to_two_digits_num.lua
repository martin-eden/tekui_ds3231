-- Convert number to two-digits integer

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

-- Imports:
local constrain_number = request('!.number.constrain')

local to_two_digits_num =
  function(num)
    assert_number(num)

    num = math.modf(num)
    num = constrain_number(num, 0, 99)

    return num
  end

-- Export:
return to_two_digits_num

--[[
  2026-05-10
]]
