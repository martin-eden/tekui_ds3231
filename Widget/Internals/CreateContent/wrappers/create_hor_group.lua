-- Create horizontal group for TekUi

--[[
  Author: Martin Eden
  Last mod.: 2026-04-27
]]

-- Imports:
local ws_create_hor_group = request('!.frontend.tekui.hor_group')

--[[
  Create horizontal group

  Input format:

    {
      Text [?s]
      Overrides [?t]
      Contents [t] -- List of items
    }
]]
local create_hor_group =
  function(Group)
    local caption = Group.Text
    local Overrides = Group.Overrides
    local Children = Group.Contents

    assert_table(Children)

    return
      ws_create_hor_group(
        caption,
        Overrides,
        table.unpack(Children)
      )
  end

-- Export:
return create_hor_group

--[[
  2026-04-27
]]
