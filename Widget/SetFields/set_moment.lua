-- Set fields for "moment" page

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Imports:
local prefix_args = request('!.function.prefix_args')
local set_input_text_stock = request('!.frontend.tekui.set_input_text')
local set_checkbox_stock = request('!.frontend.tekui.set_checkbox')

local SetMomentPage =
  function(TekUi_App, Rtc_Rec)
    local set_input_text = prefix_args(set_input_text_stock, TekUi_App)
    local set_checkbox = prefix_args(set_checkbox_stock, TekUi_App)

    set_input_text(
      'moment_year', Rtc_Rec.moment.year
    )
    set_input_text(
      'moment_month', ('%02d'):format(Rtc_Rec.moment.month)
    )
    set_input_text(
      'moment_date', ('%02d'):format(Rtc_Rec.moment.date)
    )
    set_input_text(
      'moment_dow', Rtc_Rec.moment.dow
    )
    set_input_text(
      'moment_hour', ('%02d'):format(Rtc_Rec.moment.hour)
    )
    set_input_text(
      'moment_minute', ('%02d'):format(Rtc_Rec.moment.minute)
    )
    set_input_text(
      'moment_second', ('%02d'):format(Rtc_Rec.moment.second)
    )
    set_checkbox(
      'moment_store_hour_in_12h', Rtc_Rec.moment.store_hour_in_12h
    )
  end

-- Export:
return SetMomentPage

--[[
  2020 #
  2026-04-28
]]
