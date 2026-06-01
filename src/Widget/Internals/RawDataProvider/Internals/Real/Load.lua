-- Load raw I2C data

--[[
  Author: Martin Eden
  Last mod.: 2026-05-27
]]

local read_chunk_size = 200

local Load =
  function(Me)
    local Compiler = Me.Compiler
    local device_id = Me.DeviceId
    local data_size = 19

    Compiler.request.i2c_read(Compiler, device_id, 0, data_size)

    local data_str = Me.Teletype.Input:Read(read_chunk_size)

    --[[
      At heavy load it fails

      At substantial I2C read load with occasional I2C writes
      we'll start getting nothing from teletype. Re-reads won't help.

      We don't know what part is exactly failed, maybe Firmata
      firmware itself. Bottom line is that we can't fulfill contract.
    ]]
    if (data_str == '') then return { } end

    Me.InputBuffer:add(data_str)

    local Records, status = Me.Parser:parse()

    for _, Rec in ipairs(Records) do
      if
        (Rec.type == 'i2c_reply') and
        (Rec.device_id == device_id)
      then
        return Rec.data
      end
    end

    return { }
  end

-- Export:
return Load

--[[
  2026-04-28
  2026-05-13
]]
