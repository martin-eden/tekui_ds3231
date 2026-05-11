#!/bin/lua

-- Root script

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

-- [[ Develop
package.path = package.path .. ';../../?.lua'
--]]
require('workshop.base')

local Config =
  {
    DeviceFileName = arg[1],
    IsVirtualDevice = (arg[1] == '--virtual'),
  }

-- Imports:
local Widget = request('Widget.Interface')
-- [[ Debug
_G.t2s = request('!.convert.table_to_str')
-- _G.t2s = request('!.concepts.lua_table_code.save')
--]]

local requires_tekui_msg = [[
This tool requires TekUI GUI framework

TekUI site:

  http://tekui.neoscientists.org/

TekUI package:

  http://tekui.neoscientists.org/releases/tekui-1.12-r1.tgz

My notes how to install:

  https://gist.github.com/martin-eden/e721436788994e5b183e94fb2f84b30b
]]

local has_tekui =
  function()
    return (pcall(require, 'tek.ui'))
  end

if not has_tekui() then
  print(requires_tekui_msg)

  return
end

local usage_msg = [[
GUI to display and edit data of hardware clock module DS331

Usage:

  lua run.lua <DevicePath>
                   ┬
                   ├── "/dev/ttyUSB<N>" -- use device at that port
                   └── "--virtual" -- use virtual device (data in local file)
]]

if not arg[1] then
  print(usage_msg)

  return
end

local Application =
  Widget:CreateApplication(
    {
      DeviceFileName = Config.DeviceFileName,
      IsVirtualDevice = Config.IsVirtualDevice,
    }
  )

if not Application then
  print('Failed to initialize application')

  return
end

Application:run()

--[[
  2019 #
  2020 # #
  2026-04-27
  2026-04-28
  2026-04-29
  2026-05-10
  2026-05-12
]]
