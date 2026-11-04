-- Create TekUI application for our widget

--[[
  Author: Martin Eden
  Last mod.: 2026-11-05
]]

local TekUi = require('tek.ui')

do
  local TekUi_Debug = require('tek.lib.debug')
  TekUi_Debug.level = TekUi_Debug.ERROR
end

local normalize_file_name = request('!.concepts.path_name.normalize')
local create_window = request('!.frontend.tekui.create_window')
local special_checkbox_coloring = request('Internals.special_checkbox_coloring')

return
  function(Me, device_file_name)
    local RawDataProvider = Me.RawDataProvider

    device_file_name = normalize_file_name(device_file_name)

    local init_done = RawDataProvider:Init(device_file_name)

    if not init_done then
      print('Failed to initialize device')

      return
    end

    local Content = Me:CreateContent()

    local title = string.format('DS3231 on %s', device_file_name)

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

--[[
  2026-05-12
  2026-11-05
]]
