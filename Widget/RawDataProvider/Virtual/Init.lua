-- Init data provider

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local file_exists = request('!.file_system.file.exists')
local string_to_file = request('!.string.to_file')

local default_file_contents =
  '038 071 097 001 039 004 038 137 121 160 089 003 097 233 162 007 036 155 000'

local Init =
  function(Me, _)
    local data_file_name = Me.RawDataFileName

    if not file_exists(data_file_name) then
      string_to_file(default_file_contents, data_file_name)
    end

    return true
  end

-- Export:
return Init

--[[
  2026-04-28
]]
