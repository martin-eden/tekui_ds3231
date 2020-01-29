return
  {
    create_content = request('create_content.run'),
    set_fields = request('set_fields'),
    get_fields = request('get_fields'),
    spawn_load = request('spawn_load'),
    spawn_save = request('spawn_save'),
    spawn_set_cur_time = request('spawn_set_cur_time'),
    spawn_get_temp = request('spawn_get_temp'),
    install_presentation_updaters =
      request('install_presentation_updaters'),
    --
    rtc_handler = request('rtc_handler.interface'),
  }
