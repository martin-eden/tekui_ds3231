-- Convert number to two-digits integer

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local modf = math.modf
local constrain_number = request('!.number.constrain')

return
  function(num)
    return constrain_number(modf(num), 0, 99)
  end

--[[
  2026 #
]]
