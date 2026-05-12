-- Raw data provider (TTY, Firmata)

--[[
  Author: Martin Eden
  Last mod.: 2026-05-12
]]

-- Imports:
local Teletype = request('!.concepts.StreamIo.Teletype.Interface')
local InputBuffer = request('!.mechs.streams.data_concatter.interface')
local FirmataParser = request('!.concepts.firmata.parser.interface')
local FirmataCompiler = request('!.concepts.firmata.compiler.interface')

-- Export:
return
  {
    -- Main:
    Init = request('Init'),
    Load = request('Load'),
    Save = request('Save'),

    -- Internals:
    DeviceId = 104,

    Teletype = Teletype,
    InputBuffer = InputBuffer,

    Parser = FirmataParser,
    Compiler = FirmataCompiler,
  }

--[[
  2019 #
  2020 # #
  2026-04-28
]]
