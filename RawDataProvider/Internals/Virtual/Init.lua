-- Init data provider

--[[
  Author: Martin Eden
  Last mod.: 2026-05-09
]]

-- Imports:
local file_exists = request('!.file_system.file.exists')

local Init =
  function(Me, _)
    return file_exists(Me.RawDataFileName)
  end

-- Export:
return Init

--[[
  2026-04-28
  2026-05-09
]]
