-- Return main window layout

--[[
  Author: Martin Eden
  Last mod.: 2026-04-30
]]

-- Imports:

local create_hor_group = request('CreateContent.wrappers.create_hor_group')
local create_ver_group = request('CreateContent.wrappers.create_ver_group')

local create_moment_block = request('CreateContent.create_moment_block')
local create_alarm_1_block = request('CreateContent.create_alarm_1_block')
local create_alarm_2_block = request('CreateContent.create_alarm_2_block')
local create_other_block = request('CreateContent.create_other_block')
local create_actions_block = request('CreateContent.create_actions_block')

local TekUi = require('tek.ui')

--[[
  Describe main window for TekUis

  Beware, .PageCaptions names are used in save function
  to locate current page.
]]
local create_main_window =
  function(Me)
    return
      create_ver_group(
        {
          Contents =
            {
              create_hor_group(
                {
                  Contents =
                    {
                      TekUi.PageGroup:new(
                        {
                          Id = 'tabs_pane',
                          PageCaptions = { 'moment', 'alarm 1', 'alarm 2', 'core' },
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
                    },
                }
              ),
              create_actions_block(Me),
            },
        }
      )
  end

-- Export:
return create_main_window

--[[
  2019 #
  2026-04-27
]]
