return
  {
    tty_name = '/dev/ttyUSB0',
    device_id = 0x68,
    init = request('init'),
    load_rtc = request('load_rtc'),
    save_rtc = request('save_rtc'),
    --
    data_concatter = request('!.mechs.streams.data_concatter.interface'),
    parser = request('!.concepts.firmata.parser.interface'),
    compiler = request('!.concepts.firmata.compiler.interface'),
    get_next_chunk = request('get_next_chunk'),
    f_in = nil,
    f_out = nil,
  }
