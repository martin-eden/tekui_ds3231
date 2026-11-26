-- Root script to run RTC3231 widget

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

require('workshop.base')

local requires_tekui_msg = [[
This tool requires TekUI GUI framework

TekUI site:

  http://tekui.neoscientists.org/

TekUI package:

  http://tekui.neoscientists.org/releases/tekui-1.12-r1.tgz

My notes how to install:

  https://gist.github.com/martin-eden/e721436788994e5b183e94fb2f84b30b
]]

if not (pcall(require, 'tek.ui')) then
  io.stdout:write(requires_tekui_msg)
  return
end

local usage_msg = [[
GUI to display and edit data of hardware clock module DS331

Usage:

  <device>
     ┬
     └── "/dev/ttyUSB<N>" -- use device at that port

-- Martin, 2026-11
]]

if not arg[1] then
  io.stdout:write(usage_msg)
  return
end

local data_provider = request('raw_data_provider')
local init_done = data_provider:init(arg[1])

if not init_done then
  print('Failed to initialize device')
  return
end

local widget = request('widget.interface')

local application = widget.create(data_provider)

if not application then
  print('Failed to initialize application')
  return
end

application:run()

--[[
  2019 #
  2020 # #
  2026 # # # # # # #
  2026-11-27
]]
