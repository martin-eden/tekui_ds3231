-- Return main window layout

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

local create_hor_group = request('CreateContent.wrappers.create_hor_group')
local create_ver_group = request('CreateContent.wrappers.create_ver_group')

local text_label = request('!.frontend.tekui.text_label')
local create_button = request('CreateContent.wrappers.create_button')

local create_moment_block = request('CreateContent.create_moment_block')
local create_alarm_1_block = request('CreateContent.create_alarm_1_block')
local create_alarm_2_block = request('CreateContent.create_alarm_2_block')
local create_core_block = request('CreateContent.create_core_block')

local TekUi = require('tek.ui')

local func_save = request('funcs.save')

local Save_Btn =
  {
    Text = '^',
    Handler = func_save,
    Overrides =
      {
        Width = 'fill',
        Height = 'fill'
      },
  }

local create_moment_presentation_block =
  function(Me)
    return
      text_label(
        '',
        {
          Style = Me.ui_status_style,
          Id = 'moment_presentation',
          Width = 300,
        }
      )
  end

local create_alarm_1_presentation_block =
  function(Me)
    return
      text_label(
        '',
        {
          Style = Me.ui_status_style,
          Id = 'alarm_1_presentation',
        }
      )
  end

local create_alarm_2_presentation_block =
  function(Me)
    return
      text_label(
        '',
        {
          Style = Me.ui_status_style,
          Id = 'alarm_2_presentation',
        }
      )
  end

local create_core_presentation_block =
  function(Me)
    return
      text_label(
        '',
        {
          Style = Me.ui_status_style,
          Id = 'core_presentation',
        }
      )
  end

-- These tables are set up in create_content()
local moment_block
local alarm_1_block
local alarm_2_block
local core_block

local last_content_type = ''

local replace_content =
  function(Me, content_type)
    local TekUi_App = Me.TekUi_App

    local RightPane = TekUi_App:getById('right_pane')

    local Children = RightPane:getChildren()
    for i = 1, #Children do
      RightPane:remMember(Children[1])
    end

    if (content_type ~= last_content_type) then
      local NewContent
      if (content_type == 'moment') then
        NewContent = moment_block
      elseif (content_type == 'alarm_1') then
        NewContent = alarm_1_block
      elseif (content_type == 'alarm_2') then
        NewContent = alarm_2_block
      elseif (content_type == 'core') then
        NewContent = core_block
      else
        error('Unknown content type')
      end

      RightPane:addMember(NewContent)

      last_content_type = content_type
    else
      last_content_type = ''
    end

    Me:DataToUi()
  end

local Load_Moment_Btn =
  {
    Text = '>',
    Handler = function(Me) replace_content(Me, 'moment') end,
  }

local Load_Alarm_1_Btn =
  {
    Text = '>',
    Handler = function(Me) replace_content(Me, 'alarm_1') end,
  }

local Load_Alarm_2_Btn =
  {
    Text = '>',
    Handler = function(Me) replace_content(Me, 'alarm_2') end,
  }

local Load_Core_Btn =
  {
    Text = '>',
    Handler = function(Me) replace_content(Me, 'core') end,
  }

local create_status_control_block =
  function(Me)
    return
      create_hor_group(
        {
          Overrides = { Columns = 2 },
          Contents =
            {
              create_moment_presentation_block(Me),
              create_button(Me, Load_Moment_Btn),

              create_alarm_1_presentation_block(Me),
              create_button(Me, Load_Alarm_1_Btn),

              create_alarm_2_presentation_block(Me),
              create_button(Me, Load_Alarm_2_Btn),

              create_core_presentation_block(Me),
              create_button(Me, Load_Core_Btn),
            },
        }
      )
  end

local create_right_pane =
  function(Me)
    return
      create_ver_group(
        {
          Overrides = { Id = 'right_pane' },
          Contents = { },
        }
      )
  end

--[[
  Main window content for TekUi
]]
local create_content =
  function(Me)
    moment_block = create_moment_block(Me)
    alarm_1_block = create_alarm_1_block(Me)
    alarm_2_block = create_alarm_2_block(Me)
    core_block = create_core_block(Me)

    return
      create_ver_group(
        {
          -- Overrides = { Width = 700 },
          Contents =
            {
              create_hor_group(
                {
                  Contents =
                    {
                      create_status_control_block(Me),
                      create_right_pane(Me),
                      create_button(Me, Save_Btn),
                    },
                }
              ),
            },
        }
      )
  end

-- Export:
return create_content

--[[
  2019 #
  2026-04-27
]]
