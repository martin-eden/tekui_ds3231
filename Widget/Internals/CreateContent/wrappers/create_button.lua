-- Create button for TekUi

--[[
  Author: Martin Eden
  Last mod.: 2026-05-13
]]

-- Imports:
local ws_create_button = request('!.frontend.tekui.button')
local merge_and_patch = request('!.table.merge_and_patch')

--[[
  Create button for TekUi from our custom input format:

    {
      Text [s]
      Handler [f]
      Overrides [t] -- table with TekUI properties
    }
]]

local create_button =
  function(Me, Button, Overrides)
    local caption = Button.Text
    local handler = Button.Handler

    assert_string(caption)
    assert_function(handler)

    local tekui_button_handler =
      function()
        handler(Me)
      end

    local ButtonOverrides =
      {
        onClick = tekui_button_handler,
      }

    merge_and_patch(ButtonOverrides, Button.Overrides)

    return ws_create_button(caption, ButtonOverrides)
  end

-- Export:
return create_button

--[[
  2026-04-27
  2026-04-29
  2026-05-12
  2026-05-13
]]
