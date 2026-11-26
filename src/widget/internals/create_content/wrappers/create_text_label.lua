-- Create text label object in TekUi

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

--[[
  Input structure

    name [s?]
    text [s]
    Overrides [t]
]]

local merge_and_patch = request('!.table.merge_and_patch')
local ws_create_text_label = request('!.frontend.tekui.text_label')

return
  function(label)
    local name = label.name
    local text = label.text

    local overrides = { Id = name }

    merge_and_patch(overrides, label.Overrides)

    return ws_create_text_label(text, overrides)
  end

--[[
  2026 #
]]
