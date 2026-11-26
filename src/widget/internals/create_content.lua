-- Return main window layout

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

--[[
  Contract

  Return function that returns table with window layout for TekUi.
]]

--[[
  Non-trivial parts

  We're using horizontal group of three panels.

  First panel is 4x2 grid of status text and details button.
  Second panel is dynamically filled when details button is pressed.
  Third panel is one "save" button stretched by window height.

  All content is calculated just once. Dynamic second panel uses
  precalculated sub-layouts.
]]

local create_text_label = request('create_content.wrappers.create_text_label')

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
local ui_pages =
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
  function(me)
    local details_pane = me[3]:getById('details_pane')

    local nodes = details_pane:getChildren()
    for _ = 1, #nodes do
      details_pane:remMember(nodes[1])
    end
  end

local set_details_content =
  function(me, content)
    local details_pane = me[3]:getById('details_pane')

    details_pane:addMember(content)
  end

local update_page_button_text =
  function(me, page_name)
    local page = ui_pages[page_name]

    if is_nil(page) then return end

    local button_name = page.button_name
    local page_is_loaded = page.is_loaded

    local details_btn = me[3]:getById(button_name)

    if page_is_loaded then
      details_btn:setValue('Text', '<')
      details_btn:setValue('Style', 'font: ui-main/b')
    else
      details_btn:setValue('Text', '>')
      details_btn:setValue('Style', 'font: ui-main')
    end
  end

local set_details_page =
  function(me, page_name)
    local last_page_name = ui_pages.last_page_name
    local last_page = ui_pages[last_page_name]
    local last_page_is_loaded = last_page.is_loaded

    local page = ui_pages[page_name]
    local page_is_loaded = page.is_loaded

    if last_page_is_loaded then
      empty_details_content(me)
      last_page.is_loaded = false
      update_page_button_text(me, last_page_name)
    end

    if not page_is_loaded then
      set_details_content(me, page.Content)
      page.is_loaded = true
      update_page_button_text(me, page_name)
    end

    ui_pages.last_page_name = page_name

    me:data_to_ui()
  end

local load_moment_btn =
  {
    name = ui_pages.Moment.button_name,
    text = '>',
    handler = function(me) set_details_page(me, 'Moment') end,
  }

local load_alarm_1_btn =
  {
    name = ui_pages.Alarm_1.button_name,
    text = '>',
    handler = function(me) set_details_page(me, 'Alarm_1') end,
  }

local load_alarm_2_btn =
  {
    name = ui_pages.Alarm_2.button_name,
    text = '>',
    handler = function(me) set_details_page(me, 'Alarm_2') end,
  }

local load_core_btn =
  {
    name = ui_pages.Core.button_name,
    text = '>',
    handler = function(me) set_details_page(me, 'Core') end,
  }

--[[
  Save values from input fields to device

  Data is loaded from device, updated with values from UI,
  saved to device, loaded back, and UI values are updated.
]]
local func_save =
  function(me)
    me:data_from_raw()
    me:data_from_ui()
    me:data_to_raw()
    me:data_from_raw()
    me:data_to_ui()
  end

local save_btn =
  {
    text = '^',
    handler = func_save,
    Overrides = { Height = 'fill' },
  }

local create_hor_group = request('!.frontend.tekui.create_hor_group')
local create_ver_group = request('!.frontend.tekui.create_ver_group')
local create_button = request('create_content.wrappers.create_button')

local create_status_control_block =
  function(me)
    return
      create_hor_group(
        {
          Overrides = { Columns = 2 },
          Contents =
            {
              create_moment_presentation_block(),
              create_button(me, load_moment_btn),

              create_alarm_1_presentation_block(),
              create_button(me, load_alarm_1_btn),

              create_alarm_2_presentation_block(),
              create_button(me, load_alarm_2_btn),

              create_core_presentation_block(),
              create_button(me, load_core_btn),
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

local create_moment_block = request('create_content.create_moment_block')
local create_alarm_1_block = request('create_content.create_alarm_1_block')
local create_alarm_2_block = request('create_content.create_alarm_2_block')
local create_core_block = request('create_content.create_core_block')

local ui_width = 500

-- Export:
return
  function(me)
    ui_pages.Moment.Content = create_moment_block(me, ui_width)
    ui_pages.Alarm_1.Content = create_alarm_1_block(me, ui_width)
    ui_pages.Alarm_2.Content = create_alarm_2_block(me, ui_width)
    ui_pages.Core.Content = create_core_block(me, ui_width)

    return
      create_hor_group(
        {
          Contents =
            {
              create_status_control_block(me),
              create_details_pane(),
              create_button(me, save_btn),
            },
        }
      )
  end

--[[
  2019 #
  2026 # # #
]]
