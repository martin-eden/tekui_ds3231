-- Init data provider

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local file_exists = request('!.file_system.file.exists')

local speed_bps = 57600

local Init =
  function(Me, device_file_name)
    if not file_exists(device_file_name) then
      return false
    end

    local Teletype = Me.Teletype

    Teletype:Open(device_file_name, speed_bps)

    Me.InputBuffer:init()

    Me.Parser.stream = Me.InputBuffer:get_stream()

    local Compiler = Me.Compiler

    Compiler.output = Teletype.FileHandle

    Compiler.request.i2c_config(Compiler)

    return true
  end

-- Export:
return Init

--[[
  2020
  2026-04-28
]]
