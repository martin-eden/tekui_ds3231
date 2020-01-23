local ver_group = request('^.^.tui_tools.ver_group')
local button = request('^.^.tui_tools.button')

return
  function(self)
    return
      ver_group(
        'actions',
        {},

        button('_Load', {onClick = self:create_load_handler()}),
        button('_Save', {onClick = self:create_save_handler()}),
        ver_group(
          'shortcuts',
          {},

          button(
            'Set _current time',
            {onClick = self:spawn_set_cur_time()}
          ),
          button(
            'Get _temperature',
            {onClick = self:create_get_temp_handler()}
          )
        )
      )
  end
