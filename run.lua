local tui = require('tek.ui')

package.path = package.path .. ';../../../?.lua'
require('workshop.base')

local self = request('parts.interface')

if arg[1] then
  self.rtc_handler.tty_name = arg[1]
end

self.rtc_handler:init()

-- local t2s = request('!.table.as_string')
local compile_rtc = request('!.formats.ds3231.compile')

local create_window = request('!.frontend.tekui.window')

local create_main_window =
  function(content)
    local title = ('DS3231 on %s'):format(self.rtc_handler.tty_name)
    return
      create_window(
        title,
        {
          Width = 'fill',
          Height = 'free',
        },
        content
      )
  end

local main_window = create_main_window(self:create_content())

local app = tui.Application:new()
tui.Application.connect(main_window)
app:addMember(main_window)

self:install_presentation_updaters(app)

local rtc_rec = self.rtc_handler:load_rtc()
local recommendation =
  'Check wiring. Check "StandardFirmata" sketch is burned into Arduino.'
assert(rtc_rec, "Can't get RTC record." .. ' ' .. recommendation)
self.set_fields(app, rtc_rec)

main_window:setValue('Status', 'show')

app:run()
