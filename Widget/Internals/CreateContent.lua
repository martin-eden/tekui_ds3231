-- Return main window layout

--[[
  Author: Martin Eden
  Last mod.: 2026-05-17
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
          Width = 400,
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

-- Pages content is set up in create_content()
local UiPages =
  {
    Moment = { is_loaded = false, button_id = 'load_moment', Content = { } },
    Alarm_1 = { is_loaded = false, button_id = 'load_alarm_1', Content = { } },
    Alarm_2 = { is_loaded = false, button_id = 'load_alarm_2', Content = { } },
    Core = { is_loaded = false, button_id = 'load_core', Content = { } },
    last_page_name = '',
  }

local empty_details_content =
  function(Me)
    local DetailsPane = Me.TekUi_App:getById('details_pane')

    local Children = DetailsPane:getChildren()
    for _ = 1, #Children do
      DetailsPane:remMember(Children[1])
    end
  end

local set_details_content =
  function(Me, Content)
    local DetailsPane = Me.TekUi_App:getById('details_pane')

    DetailsPane:addMember(Content)
  end

local update_page_button_text =
  function(Me, page_name)
    local Page = UiPages[page_name]

    if is_nil(Page) then return end

    local button_id = Page.button_id
    local page_is_visible = Page.is_loaded

    local DetailsButton = Me.TekUi_App:getById(button_id)

    if page_is_visible then
      DetailsButton:setValue('Text', '<')
      DetailsButton:setValue('Style', 'font: ui-main/b')
    else
      DetailsButton:setValue('Text', '>')
      DetailsButton:setValue('Style', 'font: ui-main')
    end
  end

local set_details_page =
  function(Me, page_name)
    empty_details_content(Me)

    -- ( Process last page
    local last_page_name = UiPages.last_page_name

    if (last_page_name ~= '') and (last_page_name ~= page_name) then
      local LastPage = UiPages[last_page_name]
      LastPage.is_loaded = false
      update_page_button_text(Me, last_page_name)
    end

    UiPages.last_page_name = page_name
    -- )

    -- ( Process current page
    local Page = UiPages[page_name]

    if not Page.is_loaded then
      set_details_content(Me, Page.Content)
      Page.is_loaded = true
    else
      Page.is_loaded = false
    end

    update_page_button_text(Me, page_name)
    -- )

    Me:DataToUi()
  end

local Load_Moment_Btn =
  {
    Text = '>',
    Handler = function(Me) set_details_page(Me, 'Moment') end,
    Overrides = { Id = UiPages.Moment.button_id },
  }

local Load_Alarm_1_Btn =
  {
    Text = '>',
    Handler = function(Me) set_details_page(Me, 'Alarm_1') end,
    Overrides = { Id = UiPages.Alarm_1.button_id },
  }

local Load_Alarm_2_Btn =
  {
    Text = '>',
    Handler = function(Me) set_details_page(Me, 'Alarm_2') end,
    Overrides = { Id = UiPages.Alarm_2.button_id },
  }

local Load_Core_Btn =
  {
    Text = '>',
    Handler = function(Me) set_details_page(Me, 'Core') end,
    Overrides = { Id = UiPages.Core.button_id },
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

local create_details_pane =
  function(Me)
    return
      create_ver_group(
        {
          Overrides = { Id = 'details_pane' },
          Contents = { },
        }
      )
  end

--[[
  Main window content for TekUi
]]
local create_content =
  function(Me)
    UiPages.Moment.Content = create_moment_block(Me)
    UiPages.Alarm_1.Content = create_alarm_1_block(Me)
    UiPages.Alarm_2.Content = create_alarm_2_block(Me)
    UiPages.Core.Content = create_core_block(Me)

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
                      create_details_pane(Me),
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
  2026-05-17
]]
