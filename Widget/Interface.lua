-- Widget interface

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

local width_px = 460
local blue_color = '#0049B7'
local status_style = 'font: /b; color: ' .. blue_color

-- Export:
return
  {
    -- Main:
    Init = request('Init'),
    SetFields = request('SetFields'),
    GetFields = request('GetFields'),

    -- Internals:
    RtcDataProvider = request('RtcDataProvider.Interface'),

    ui_width = width_px,
    ui_status_style = status_style,
    CreateContent = request('CreateContent'),
    UpdatePresentations = request('UpdatePresentations'),
    InstallPresentationUpdaters = request('InstallPresentationUpdaters'),
  }

--[[
  2019 #
  2020 # # #
  2026-04-27
  2026-04-28
]]
