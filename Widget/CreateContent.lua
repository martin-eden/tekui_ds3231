-- Return main window layout

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:

local horizontal_group = request('!.frontend.tekui.hor_group')
local vertical_group = request('!.frontend.tekui.ver_group')

local create_moment_block = request('CreateContent.create_moment_block')
local create_alarm_1_block = request('CreateContent.create_alarm_1_block')
local create_alarm_2_block = request('CreateContent.create_alarm_2_block')
local create_other_block = request('CreateContent.create_other_block')
local create_actions_block = request('CreateContent.create_actions_block')

local TekUi = require('tek.ui')

--[[
  Describe main window for TekUis

  Beware, .PageCaptions names are used in [spawn_save]
  to locate current page.
]]
local create_main_window =
  function(Me)
    return
      vertical_group(
        nil,
        {},
        horizontal_group(
          nil,
          {},
          TekUi.PageGroup:new(
            {
              Id = 'tabs_pane',
              PageCaptions = { 'moment', 'alarm 1', 'alarm 2', 'other' },
              PageNumber = 1,
              Children =
                {
                  create_moment_block(Me),
                  create_alarm_1_block(Me),
                  create_alarm_2_block(Me),
                  create_other_block(Me),
                },
            }
          )
        ),
        create_actions_block(Me)
      )
  end

-- Export:
return create_main_window

--[[
  2019 #
  2026-04-27
]]
