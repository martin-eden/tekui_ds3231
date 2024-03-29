#!/bin/lua

package.path = package.path .. ';../../../?.lua'
require('workshop.base')

local tui = require('tek.ui')

-- local t2s = request('!.table.as_string')
local self = request('parts.interface')
local create_window = request('!.frontend.tekui.window')
local special_cbox_coloring = request('parts.special_cbox_coloring')

if arg[1] then
  self.rtc_handler.tty_name = arg[1]
end

self.rtc_handler:init()

local create_main_window =
  function(content)
    local title = ('DS3231 on %s'):format(self.rtc_handler.tty_name)
    return create_window(title, {}, content)
  end

local main_window = create_main_window(self:create_content())

local app = tui.Application:new({AuthorStyles = special_cbox_coloring})
tui.Application.connect(main_window)
app:addMember(main_window)

self:install_presentation_updaters(app)

local rtc_rec = self.rtc_handler:load_rtc()
if not rtc_rec then
  error(
    "Can't get RTC record.\n" ..
    '  Check wiring.\n' ..
    '  Check that "StandardFirmata" sketch is burned into Arduino.'
  )
end

self:set_fields(app, rtc_rec)

main_window:setValue('Status', 'show')
app:run()
