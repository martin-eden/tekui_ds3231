-- Save raw I2C data

--[[
  Author: Martin Eden
  Last mod.: 2026-05-13
]]

local Save =
  function(Me, RawData)
    local Compiler = Me.Compiler
    local device_id = Me.DeviceId

    Compiler.request.i2c_write(
      Compiler,
      device_id,
      0,
      table.unpack(RawData)
    )
  end

-- Export:
return Save

--[[
  2026-04-28
]]
