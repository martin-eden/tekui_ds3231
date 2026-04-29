-- Raw data provider (TTY, Firmata)

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

-- Export:
return
  {
    -- Main:
    Init = request('Init'),
    Load = request('Load'),
    Save = request('Save'),

    -- Internals:
    DeviceId = 104,

    Teletype = request('!.concepts.StreamIo.Teletype.Interface'),
    InputBuffer = request('!.mechs.streams.data_concatter.interface'),

    Parser = request('!.concepts.firmata.parser.interface'),
    Compiler = request('!.concepts.firmata.compiler.interface'),
  }

--[[
  2019 #
  2020 # #
  2026-04-28
]]
