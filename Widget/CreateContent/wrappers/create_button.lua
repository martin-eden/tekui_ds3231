-- Create button for TekUi

--[[
  Author: Martin Eden
  Last mod.: 2026-04-29
]]

-- Imports:
local ws_create_button = request('!.frontend.tekui.button')
local create_button_handler = request('create_button.create_button_handler')

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

    local tekui_button_handler = create_button_handler(Me, handler)

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
]]
