--[[
  Iterates over names like "/dev/ttyUSB0", "/dev/ttyUSB1" etc.

  So it just extracts number from end of string, adds one to it,
  puts it back to string and returns that string.

  But if new number equal 8 (<wrap_size>) - it sets to zero.
]]

local wrap_size = 8

return
  function(cur_tty_name)
    assert_string(cur_tty_name)
    orig_tty_name = orig_tty_name or cur_tty_name
    local prefix, index = cur_tty_name:match('(.-)(%d+)$')
    index = (index + 1) % wrap_size
    local result = prefix .. ('%d'):format(index)
    return result
  end
