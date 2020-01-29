local ver_group = request('^.^.tui_tools.ver_group')
local button = request('^.^.tui_tools.button')

return
  function(self)
    return
      ver_group(
        'actions',
        {},

        button('_Load', {onClick = self:spawn_load()}),
        button('_Save', {onClick = self:spawn_save()}),
        ver_group(
          'shortcuts',
          {},

          button(
            'Set _current time',
            {onClick = self:spawn_set_cur_time()}
          ),
          button(
            'Get _temperature',
            {onClick = self:spawn_get_temp()}
          )
        )
      )
  end
