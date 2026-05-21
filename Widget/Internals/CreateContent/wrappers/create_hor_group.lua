-- Create horizontal group for TekUi

--[[
  Author: Martin Eden
  Last mod.: 2026-05-21
]]

-- Imports:
local ws_create_hor_group = request('!.frontend.tekui.hor_group')

--[[
  Create horizontal group

  Input format:

    {
      caption [?s] -- title text for group
      Contents [t] -- List of items
      Overrides [?t]
    }
]]
local create_hor_group =
  function(Group)
    local caption = Group.caption
    local Contents = Group.Contents
    local Overrides = Group.Overrides

    assert_table(Contents)

    return
      ws_create_hor_group(
        caption,
        Overrides,
        table.unpack(Contents)
      )
  end

-- Export:
return create_hor_group

--[[
  2026-04-27
]]
