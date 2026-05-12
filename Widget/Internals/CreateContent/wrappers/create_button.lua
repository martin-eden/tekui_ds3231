-- Create button for TekUi

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

-- Imports:
local ws_create_button = request('!.frontend.tekui.button')

--[[
  Create button for TekUi from our custom input format:

    Me [t]
    {
      Text [s]
      Handler [f]
    }
]]

local create_button =
  function(Me, Button)
    local caption = Button.Text
    local handler = Button.Handler

    assert_string(caption)
    assert_function(handler)

    local tekui_button_handler =
      function(TekUi_App)
        handler(Me, TekUi_App)
      end

    return
      ws_create_button(
        caption,
        { onClick = tekui_button_handler }
      )
  end

-- Export:
return create_button

--[[
  2026-04-27
  2026-04-29
  2026-05-12
]]
