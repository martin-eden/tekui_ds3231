-- Data provider for DS3231 RTC on Firmata

--[[
  Author: Martin Eden
  Last mod.: 2026-11-27
]]

--[[
  Storage format

    1 [t] -- teletype instance
    2 [t] -- Firmata compiler instance
    3 [t] -- input stream for Firmata parser
    4 [t] -- Firmata parser instance
]]

local init
do
  local teletype_class = request('!.concepts.streams.teletype')
  local speed_bps = 57600
  local firmata_compiler =
    request('!.concepts.firmata.compiler.interface')
  local seekable_input_string_stream_class =
    request('!.mechs.streams.mergeable.string.interface')
  local firmata_parser = request('!.concepts.firmata.parser.interface')
  init =
    function(me, device_file_name)
      me[1] = teletype_class.create(device_file_name)

      local is_ok = me[1]:open(speed_bps)
      if not is_ok then return end

      me[2] = new(firmata_compiler)
      me[2].output = me[1][4]

      me[3] = new(seekable_input_string_stream_class)

      me[4] = new(firmata_parser)
      me[4].stream = me[3]

      me[2].request.i2c_config(me[2])

      return true
    end
end

local device_id = 104

local load
do
  local data_size = 19
  local read_chunk_size = 200
  load =
    function(me)
      me[2].request.i2c_read(me[2], device_id, 0, data_size)

      local data_str = me[1].input:read(read_chunk_size)

      if (data_str == '') then return { } end

      me[3]:init(data_str)

      local records = me[4]:parse()
      for _, rec in ipairs(records) do
        if (rec.type == 'i2c_reply') and (rec.device_id == device_id) then
          return rec.data
        end
      end

      return { }
    end
end

local save
do
  local tbl_unpack = table.unpack
  save =
    function(me, raw_data)
      me[2].request.i2c_write(
        me[2],
        device_id,
        0,
        tbl_unpack(raw_data)
      )
    end
end

local interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function()
      local me = { }
      attach_methods(me, interface)
      return me
    end
end

interface =
  {
    create = create,
    init = init,
    load = load,
    save = save,
  }

-- Export:
return interface

--[[
  2019 #
  2020 # #
  2026 # # #
]]
