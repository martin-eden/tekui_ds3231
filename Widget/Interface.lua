-- Widget interface

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

--[[
  Interface

    RawDataProvider [t] -- raw data provider
    TekUi_App [t] -- TekUI Application instance
    Data [t] -- data in out custom format

    Init [f]
    DataFromRaw [f] -- load data from data provider
    DataToUi [f] -- set UI values from data
    DataFromUi [f] -- set data from UI values
    DataToRaw [f] -- save data to data provider
]]

-- Imports:
local Ds3231_Codec = request('!.concepts.codec_ds3231.Interface')

-- Export:
return
  {
    -- Config:
    RawDataProvider = { },
    TekUi_App = { },

    -- Main:
    Init = request('Init'),
    DataFromRaw = request('DataFromRaw'),
    DataToUi = request('DataToUi'),
    DataFromUi = request('DataFromUi'),
    DataToRaw = request('DataToRaw'),

    -- Internals:
    Data = { },
    Ds3231_Codec = Ds3231_Codec,

    ui_width = 460,
    ui_status_style = 'font: /b; color: #0049B7',

    CreateContent = request('Internals.CreateContent'),
    UpdatePresentations = request('Internals.UpdatePresentations'),
    InstallPresentationUpdaters = request('Internals.InstallPresentationUpdaters'),
  }

--[[
  2019 #
  2020 # # #
  2026-04-27
  2026-04-28
  2026-05-09
]]
