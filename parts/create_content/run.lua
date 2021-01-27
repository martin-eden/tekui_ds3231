--[[
  Describe main window (for TekUI).

  Beware, .PageCaptions names are used in [spawn_save] to find
  current page.
]]

local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')

local create_moment_block = request('create_moment_block')
local create_output_pins_block = request('create_output_pins_block')
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
              PageCaptions = {'Just RTC', 'Output pins', 'Thremometer'},
              PageNumber = 2,
              Id = 'tabs_pane',
              Children =
                {
                  create_moment_block(self),
                  create_output_pins_block(self),
                  create_other_block(self),
                },
            }
          )
        ),
        create_actions_block(self)
      )
  end
