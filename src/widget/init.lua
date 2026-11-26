-- Create TekUI application for our widget

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

local tekui = require('tek.ui')

local add_ticker =
  function(me, handler, tekui_window)
    tekui_window:addInputHandler(tekui.MSG_INTERVAL, me, handler)
  end

local remove_ticker =
  function(me, handler, tekui_window)
    tekui_window:remInputHandler(tekui.MSG_INTERVAL, me, handler)
  end

do
  local tekui_debug = require('tek.lib.debug')
  tekui_debug.level = tekui_debug.ERROR
end

local create_tickers = request('internals.create_tickers')
local create_content = request('internals.create_content')
local create_window = request('!.frontend.tekui.create_window')
local special_checkbox_coloring = request('internals.special_checkbox_coloring')

local str_format = string.format

return
  function(me)
    local overrides
    do
      local tickers = create_tickers(me)
      local add_tickers =
        function(tekui_window)
          for idx, handler in ipairs(tickers) do
            add_ticker(me, handler, tekui_window)
          end
        end
      local remove_tickers =
        function(tekui_window)
          for idx, handler in ipairs(tickers) do
            remove_ticker(me, handler, tekui_window)
          end
        end
      overrides =
        {
          show =
            function(tekui_window, drawable)
              add_tickers(tekui_window)
              tekui.Window.show(tekui_window, drawable)
            end,
          hide =
            function(tekui_window)
              remove_tickers(tekui_window)
              tekui.Window.hide(tekui_window)
            end,
        }
    end

    local title = str_format('DS3231 on %s', device_file_name)
    local content = create_content(me)

    local window = create_window(title, overrides, content)

    tekui.Application.connect(window)

    local application =
      tekui.Application:new(
        { AuthorStyles = special_checkbox_coloring }
      )

    application:addMember(window)

    me[3] = application

    me:data_from_raw()
    me:data_to_ui()

    window:show()
  end

--[[
  2026 # #
]]
