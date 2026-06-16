-- Widget interface

--[[
  Author: Martin Eden
  Last mod.: 2026-06-16
]]

--[[
  Interface

    CreateApplication [f] -- create TekUI application

    RawDataProvider [t] -- raw data provider
    TekUi_App [t] -- TekUI Application instance

    Data [t] -- data in out custom format

    DataFromRaw [f] -- load data from data provider
    DataToUi [f] -- set UI values from data
    DataFromUi [f] -- set data from UI values
    DataToRaw [f] -- save data to data provider
]]

-- Imports:
local RawDataProvider = request('Internals.RawDataProvider.Interface')

-- Export:
return
  {
    -- Main:
    CreateApplication = request('CreateApplication'),

    -- Internals:
    RawDataProvider = RawDataProvider,
    TekUi_App = { },
    Data = { },
    Tickers = { },

    ui_width = 400,

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
  2026-04 # #
  2026-05 # # #
  2026-06-16
]]
