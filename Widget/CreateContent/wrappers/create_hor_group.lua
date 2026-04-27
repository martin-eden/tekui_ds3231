-- Create horizontal group for TekUi

--[[
  Author: Martin Eden
  Last mod.: 2026-04-27
]]

-- Imports:
local ws_create_hor_group = request('!.frontend.tekui.hor_group')

--[[
  Create horizontal group from our custom format:

    (
      1 [t] -- List of items
      Name [?s]
      Overrides [?t]
    )
]]
local create_hor_group =
  function(Group)
    local caption = Group.Name
    local Children = Group[1]
    local Overrides = Group.Overrides

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
