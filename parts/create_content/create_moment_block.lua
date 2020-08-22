local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')
local text_label = request('!.frontend.tekui.text_label')
local input_box = request('!.frontend.tekui.input_box')
local checkbox = request('!.frontend.tekui.checkbox')
local button = request('!.frontend.tekui.button')

return
  function(self)
    return
      ver_group(
        nil,
        {Width = self.ui_width},
        hor_group(
          '',
          {},
          text_label(
            '',
            {
              Style = self.ui_status_style,
              Id = 'moment_presentation',
            }
          )
        ),
        ver_group(
          nil,
          {},
          hor_group(
            nil,
            {Width = 'free'},
            input_box('', 'moment_year'),
            input_box('', 'moment_month'),
            input_box('', 'moment_date'),
            input_box('', 'moment_dow'),
            input_box('', 'moment_hour'),
            input_box('', 'moment_minute'),
            input_box('', 'moment_second')
          )
        ),
        checkbox('AM/PM hour format', false, 'moment_store_hour_in_12h'),
        button('Set _current time', {onClick = self:spawn_set_cur_time()})
      )
  end
