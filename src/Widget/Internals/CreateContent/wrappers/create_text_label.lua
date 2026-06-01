-- Create text label object in TekUi

--[[
  Author: Martin Eden
  Last mod.: 2026-05-22
]]

--[[
  Input structure

    name [s?]
    text [s]
    Overrides [t]
]]

-- Imports:
local ws_create_text_label = request('!.frontend.tekui.text_label')
local merge_and_patch = request('!.table.merge_and_patch')

local create_text_label =
  function(Label)
    local name = Label.name
    local text = Label.text

    local Overrides = { Id = name }

    merge_and_patch(Overrides, Label.Overrides)

    return ws_create_text_label(text, Overrides)
  end

-- Export:
return create_text_label

--[[
  2026-05-18
]]
