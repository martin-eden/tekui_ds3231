-- Create button for TekUi

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local merge_and_patch = request('!.table.merge_and_patch')
local ws_create_button = request('!.frontend.tekui.button')

--[[
  Create button for TekUi from our custom input format:

    [t] -- button rec
      name [s]
      text [s]
      handler [f]
      Overrides [t] -- table with TekUI properties to override
]]

return
  function(me, button)
    local name = button.name
    local caption = button.text
    local handler = button.handler

    assert_string(caption)
    assert_function(handler)

    local tekui_button_handler =
      function()
        handler(me)
      end

    local button_overrides =
      {
        Id = name,
        onClick = tekui_button_handler,
      }

    merge_and_patch(button_overrides, button.Overrides)

    return ws_create_button(caption, button_overrides)
  end

--[[
  2026 # # # # #
]]
