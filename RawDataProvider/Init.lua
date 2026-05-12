-- Initialize instance to one of the possible implementations

--[[
  Author: Martin Eden
  Last mod.: 2026-05-10
]]

local RealProvider = request('Internals.Real.Interface')
local VirtualProvider = request('Internals.Virtual.Interface')

--[[
  Input structure

  Params
  {
    UseVirtualDevice [b]
    DeviceFileName [s]
  }
]]
local Init =
  function(Me, Params)
    local is_virtual_device = Params.UseVirtualDevice

    local device_file_name
    if is_virtual_device then
      device_file_name = ''
    else
      device_file_name = Params.DeviceFileName
    end

    local UsedProvider
    if is_virtual_device then
      UsedProvider = VirtualProvider
    else
      UsedProvider = RealProvider
    end

    Me.ActualProvider = UsedProvider

    return Me.ActualProvider:Init(device_file_name)
  end

-- Export:
return Init

--[[
  2026-04-28
]]
