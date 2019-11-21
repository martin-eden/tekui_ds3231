return
  {
    create_content = request('create_content.run'),
    set_fields = request('set_fields'),
    get_fields = request('get_fields'),
    create_load_handler = request('create_load_handler'),
    create_save_handler = request('create_save_handler'),
    create_set_cur_time_handler = request('create_set_cur_time_handler'),
    create_get_temp_handler = request('create_get_temp_handler'),
    install_presentation_updaters =
      request('install_presentation_updaters'),
    --
    rtc_handler = request('rtc_handler.interface'),
  }
