local blue_color = '#0049B7'

return
  {
    -- All windows width, in pixels.
    ui_width = 460,
    -- Font for status messages.
    ui_status_style = 'font: /b; color: ' .. blue_color,

    create_content = request('create_content.run'),
    spawn_load = request('button_funcs.spawn_load'),
    spawn_save = request('button_funcs.spawn_save'),
    spawn_set_cur_time = request('button_funcs.spawn_set_cur_time'),
    spawn_get_temp = request('button_funcs.spawn_get_temp'),
    install_presentation_updaters =
      request('install_presentation_updaters'),

    set_fields = request('set_fields.run'),
    get_fields = request('get_fields.run'),
    update_presentations = request('update_presentations.run'),
    --
    rtc_handler = request('illusive_rtc_handler.interface'),
  }
