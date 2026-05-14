-- Create TekUI application for our widget

--[[
  Author: Martin Eden
  Last mod.: 2026-05-15
]]

--[[
  Input data

    (
      IsVirtualDevice [b] -- do not connect to device
      DeviceFileName [s] -- device file name
    )
]]

local TekUi = require('tek.ui')
local TekUi_Debug = require 'tek.lib.debug'

local normalize_file_name = request('!.file_system.file.normalize_name')
local create_window = request('!.frontend.tekui.create_window')

local special_checkbox_coloring = request('Internals.special_checkbox_coloring')

TekUi_Debug.level = TekUi_Debug.ERROR

local CreateApplication =
  function(Me, Config)
    local is_virtual_device = Config.IsVirtualDevice
    local device_file_name = Config.DeviceFileName

    local RawDataProvider = Me.RawDataProvider

    device_file_name = normalize_file_name(device_file_name)

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

    local Content = Me:CreateContent()

    local title
    if is_virtual_device then
      title = 'Virtual DS3231'
    else
      title = string.format('DS3231 on %s', device_file_name)
    end

    local Tickers = Me:CreateTickers()

    local WindowOverrides =
      {
        show =
          function(TekUi_Window, drawable)
            TekUi.Window.show(TekUi_Window, drawable)

            for idx, handler in ipairs(Tickers) do
              TekUi_Window:addInputHandler(
                TekUi.MSG_INTERVAL,
                Me,
                handler
              )
            end
          end,

        hide =
          function(TekUi_Window)
            for idx, handler in ipairs(Tickers) do
              TekUi_Window:remInputHandler(
                TekUi.MSG_INTERVAL,
                Me,
                handler
              )
            end
            TekUi.Window.hide(TekUi_Window)
          end,
      }

    local MainWindow = create_window(title, WindowOverrides, Content)

    TekUi.Application.connect(MainWindow)

    local Application =
      TekUi.Application:new(
        { AuthorStyles = special_checkbox_coloring }
      )

    Application:addMember(MainWindow)

    Me.TekUi_App = Application

    Me:DataFromRaw()
    Me:DataToUi()

    MainWindow:show()

    return Application
  end

-- Export:
return CreateApplication

--[[
  2026-05-12
]]
