#!/bin/lua

-- Root script

--[[
  Author: Martin Eden
  Last mod.: 2026-05-11
]]

--[[ Develop
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
local normalize_file_name = request('!.file_system.file.normalize_name')
local create_window = request('!.frontend.tekui.create_window')
local special_checkbox_coloring = request('Widget.Internals.special_checkbox_coloring')
local RawDataProvider = request('RawDataProvider.Interface')
--[[ Debug
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

--[[
  TekUI import

  It's placed here to be after code check for it's presence and
  graceful failure.
]]
local TekUi = require('tek.ui')

local is_virtual_device = Config.IsVirtualDevice
local device_file_name = normalize_file_name(Config.DeviceFileName)

local init_done =
  RawDataProvider:Init(
    {
      UseVirtualDevice = is_virtual_device,
      DeviceFileName = device_file_name,
    }
  )

if not init_done then
  print('Failed to initialize device')

  return
end

local create_main_window =
  function(Content)
    local title
    if is_virtual_device then
      title = 'Virtual DS3231'
    else
      title = string.format('DS3231 on %s', device_file_name)
    end

    return create_window(title, { }, Content)
  end

local MainWindow = create_main_window(Widget:CreateContent())

TekUi.Application.connect(MainWindow)

local Application =
  TekUi.Application:new(
    { AuthorStyles = special_checkbox_coloring }
  )

Application:addMember(MainWindow)

Widget.RawDataProvider = RawDataProvider
Widget.TekUi_App = Application

if not Widget:Init() then
  print('Failed to load data')
  if not is_virtual_device then
    print([[

  * Check wiring
  * Check that "StandardFirmata" sketch is loaded into board
]]
    )
  end

  return
end

MainWindow:setValue('Status', 'show')

Application:run()

--[[
  2019 #
  2020 # #
  2026-04-27
  2026-04-28
  2026-04-29
  2026-05-10
]]
