-- Data provider for DS3231 RTC on Firmata

--[[
  Author: Martin Eden
  Last mod.: 2026-11-04
]]

--[[
  Storage format

    1 [t] -- teletype instance
    2 [t] -- Firmata compiler instance
    3 [t] -- input stream data for parser
    4 [t] -- Firmata parser instance
]]

local device_id = 104
local data_size = 19

local init
do
  local TeletypeClass = request('!.concepts.StreamIo.Teletype')
  local FirmataCompiler = request('!.concepts.firmata.compiler.interface')
  local StringStreamClass =
    request('!.mechs.streams.mergeable.string.interface')
  local FirmataParser = request('!.concepts.firmata.parser.interface')

  init =
    function(Me, device_file_name)
      local speed_bps = 57600

      Me[1] = TeletypeClass.create(device_file_name)

      local is_ok = Me[1]:Open(speed_bps)
      if not is_ok then return end

      Me[2] = new(FirmataCompiler)
      Me[2].output = Me[1][4]

      Me[3] = new(StringStreamClass)

      Me[4] = new(FirmataParser)
      Me[4].stream = Me[3]

      Me[2].request.i2c_config(Me[2])

      return true
    end
end

local load
do
  local read_chunk_size = 200
  load =
    function(Me)
      Me[2].request.i2c_read(Me[2], device_id, 0, data_size)

      local data_str = Me[1].Input:Read(read_chunk_size)

      --[[
        At heavy load it fails

        At substantial I2C read load with occasional I2C writes
        we'll start getting nothing from teletype. Re-reads won't help.

        We don't know what part is exactly failed, maybe Firmata
        firmware itself. Bottom line is that we can't fulfill contract.
      ]]
      if (data_str == '') then return { } end

      Me[3]:init(data_str)

      local Records, status = Me[4]:parse()

      for _, Rec in ipairs(Records) do
        if (Rec.type == 'i2c_reply') and (Rec.device_id == device_id) then
          return Rec.data
        end
      end

      return { }
    end
end

local save
do
  local tbl_unpack = table.unpack
  save =
    function(Me, RawData)
      Me[2].request.i2c_write(
        Me[2],
        device_id,
        0,
        tbl_unpack(RawData)
      )
    end
end

local Interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function()
      local Me = { }
      attach_methods(Me, Interface)
      return Me
    end
end

Interface =
  {
    create = create,
    Init = init,
    Load = load,
    Save = save,
  }

-- Export:
return Interface

--[[
  2019 #
  2020 # #
  2026 # #
  2026-11-04
]]
