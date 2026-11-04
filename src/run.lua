-- Root script to run RTC3231 widget

--[[
  Author: Martin Eden
  Last mod.: 2026-11-05
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

local has_tekui =
  function()
    return (pcall(require, 'tek.ui'))
  end

if not has_tekui() then
  io.stdout:write(requires_tekui_msg)

  return
end

local Widget = request('Widget.Interface')

local usage_msg = [[
GUI to display and edit data of hardware clock module DS331

Usage:

  <DevicePath>
       ┬
       └── "/dev/ttyUSB<N>" -- use device at that port

-- Martin, 2026-11
]]

if not arg[1] then
  io.stdout:write(usage_msg)

  return
end

local Application = Widget:CreateApplication(arg[1])

if not Application then
  print('Failed to initialize application')

  return
end

Application:run()

--[[
  2019 #
  2020 # #
  2026-04 # # #
  2026-05 # #
  2026-11-05
]]
