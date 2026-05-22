-- Return main window layout

--[[
  Author: Martin Eden
  Last mod.: 2026-05-22
]]

-- ( Imports
local create_moment_block = request('CreateContent.create_moment_block')
local create_alarm_1_block = request('CreateContent.create_alarm_1_block')
local create_alarm_2_block = request('CreateContent.create_alarm_2_block')
local create_core_block = request('CreateContent.create_core_block')

local create_hor_group = request('CreateContent.wrappers.create_hor_group')
local create_ver_group = request('CreateContent.wrappers.create_ver_group')
local create_button = request('CreateContent.wrappers.create_button')
local create_text_label = request('CreateContent.wrappers.create_text_label')

local TekUi = require('tek.ui')
-- )

local presentation_text_style = 'font: /b; color: #0049B7'

local create_moment_presentation_block =
  function()
    return
      create_text_label(
        {
          name = 'moment_presentation',
          Overrides =
            { Style = presentation_text_style, Width = 400 },
        }
      )
  end

local create_alarm_1_presentation_block =
  function()
    return
      create_text_label(
        {
          name = 'alarm_1_presentation',
          Overrides = { Style = presentation_text_style },
        }
      )
  end

local create_alarm_2_presentation_block =
  function()
    return
      create_text_label(
        {
          name = 'alarm_2_presentation',
          Overrides = { Style = presentation_text_style },
        }
      )
  end

local create_core_presentation_block =
  function()
    return
      create_text_label(
        {
          name = 'core_presentation',
          Overrides = { Style = presentation_text_style },
        }
      )
  end

-- Pages content is set up in create_content()
local UiPages =
  {
    ['Moment'] =
      { button_name = 'load_moment', is_loaded = false, Content = { } },
    ['Alarm_1'] =
      { button_name = 'load_alarm_1', is_loaded = false, Content = { } },
    ['Alarm_2'] =
      { button_name = 'load_alarm_2', is_loaded = false, Content = { } },
    ['Core'] =
      { button_name = 'load_core', is_loaded = false, Content = { } },

    last_page_name = 'Moment',
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

    local button_name = Page.button_name
    local page_is_loaded = Page.is_loaded

    local DetailsButton = Me.TekUi_App:getById(button_name)

    if page_is_loaded then
      DetailsButton:setValue('Text', '<')
      DetailsButton:setValue('Style', 'font: ui-main/b')
    else
      DetailsButton:setValue('Text', '>')
      DetailsButton:setValue('Style', 'font: ui-main')
    end
  end

local set_details_page =
  function(Me, page_name)
    local last_page_name = UiPages.last_page_name
    local LastPage = UiPages[last_page_name]
    local last_page_is_loaded = LastPage.is_loaded

    local Page = UiPages[page_name]
    local page_is_loaded = Page.is_loaded

    if last_page_is_loaded then
      empty_details_content(Me)
      LastPage.is_loaded = false
      update_page_button_text(Me, last_page_name)
    end

    if not page_is_loaded then
      set_details_content(Me, Page.Content)
      Page.is_loaded = true
      update_page_button_text(Me, page_name)
    end

    UiPages.last_page_name = page_name

    Me:DataToUi()
  end

local Load_Moment_Btn =
  {
    name = UiPages.Moment.button_name,
    text = '>',
    handler = function(Me) set_details_page(Me, 'Moment') end,
  }

local Load_Alarm_1_Btn =
  {
    name = UiPages.Alarm_1.button_name,
    text = '>',
    handler = function(Me) set_details_page(Me, 'Alarm_1') end,
  }

local Load_Alarm_2_Btn =
  {
    name = UiPages.Alarm_2.button_name,
    text = '>',
    handler = function(Me) set_details_page(Me, 'Alarm_2') end,
  }

local Load_Core_Btn =
  {
    name = UiPages.Core.button_name,
    text = '>',
    handler = function(Me) set_details_page(Me, 'Core') end,
  }

--[[
  Save values from input fields to device

  Data is loaded from device, updated with values from UI,
  saved to device, loaded back, and UI values are updated.
]]
local func_save =
  function(Me)
    Me:DataFromRaw()
    Me:DataFromUi()
    Me:DataToRaw()
    Me:DataFromRaw()
    Me:DataToUi()
  end

local Save_Btn =
  {
    text = '^',
    handler = func_save,
    Overrides = { Height = 'fill' },
  }

local create_status_control_block =
  function(Me)
    return
      create_hor_group(
        {
          Overrides = { Columns = 2 },
          Contents =
            {
              create_moment_presentation_block(),
              create_button(Me, Load_Moment_Btn),

              create_alarm_1_presentation_block(),
              create_button(Me, Load_Alarm_1_Btn),

              create_alarm_2_presentation_block(),
              create_button(Me, Load_Alarm_2_Btn),

              create_core_presentation_block(),
              create_button(Me, Load_Core_Btn),
            },
        }
      )
  end

local create_details_pane =
  function()
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
      create_hor_group(
        {
          Contents =
            {
              create_status_control_block(Me),
              create_details_pane(),
              create_button(Me, Save_Btn),
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
  2026-05-22
]]
