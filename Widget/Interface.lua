-- Widget interface

--[[
  Author: Martin Eden
  Last mod.: 2026-05-18
]]

--[[
  Interface

    CreateApplication [f] -- create TekUI application

    RawDataProvider [t] -- raw data provider
    Ds3231_Codec [t] -- codec for raw data
    TekUi_App [t] -- TekUI Application instance

    Data [t] -- data in out custom format

    DataFromRaw [f] -- load data from data provider
    DataToUi [f] -- set UI values from data
    DataFromUi [f] -- set data from UI values
    DataToRaw [f] -- save data to data provider
]]

-- Imports:
local Ds3231_Codec = request('!.concepts.codec_ds3231.Interface')

local RawDataProvider = request('Internals.RawDataProvider.Interface')

-- Export:
return
  {
    -- Main:
    CreateApplication = request('CreateApplication'),

    -- Internals:
    RawDataProvider = RawDataProvider,
    Ds3231_Codec = Ds3231_Codec,
    TekUi_App = { },
    Data = { },
    Tickers = { },

    ui_width = 460,

    DataFromRaw = request('DataFromRaw'),
    DataToUi = request('DataToUi'),
    DataFromUi = request('DataFromUi'),
    DataToRaw = request('DataToRaw'),
    CreateContent = request('Internals.CreateContent'),
    UpdatePresentations = request('Internals.UpdatePresentations'),
    CreateTickers = request('Internals.CreateTickers'),
  }

--[[
  2019 #
  2020 # # #
  2026-04-27
  2026-04-28
  2026-05-09
  2026-05-12
  2026-05-15
]]
