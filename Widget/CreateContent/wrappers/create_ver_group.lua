-- Create vertical group for TekUi

--[[
  Author: Martin Eden
  Last mod.: 2026-04-29
]]

-- Imports:
local ws_create_ver_group = request('!.frontend.tekui.ver_group')

--[[
  Create vertical group

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
      ws_create_ver_group(
        caption,
        Overrides,
        table.unpack(Children)
      )
  end

-- Export:
return create_hor_group

--[[
  2026-04-29
]]
