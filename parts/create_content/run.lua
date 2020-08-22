--[[
  Describe main window (for TekUI).

  Beware, .PageCaptions names are used in [spawn_save] to find
  current page.
]]

local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')

local create_moment_block = request('create_moment_block')
local create_alarm_1_block = request('create_alarm_1_block')
local create_alarm_2_block = request('create_alarm_2_block')
local create_other_block = request('create_other_block')
local create_actions_block = request('create_actions_block')

local tui = require('tek.ui')

return
  function(self)
    return
      ver_group(
        nil,
        {},
        hor_group(
          nil,
          {},
          tui.PageGroup:new(
            {
              PageCaptions = {'moment', 'alarm 1', 'alarm 2', 'other'},
              PageNumber = 1,
              Id = 'tabs_pane',
              Children =
                {
                  create_moment_block(self),
                  create_alarm_1_block(self),
                  create_alarm_2_block(self),
                  create_other_block(self),
                },
            }
          )
        ),
        create_actions_block(self)
      )
  end
