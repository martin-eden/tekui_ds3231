local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')
local text_label = request('!.frontend.tekui.text_label')
local text_label_ra = request('!.frontend.tekui.text_label_ra')
local input_box = request('!.frontend.tekui.input_box')
local checkbox = request('!.frontend.tekui.checkbox')

return
  function(self)
    return
      ver_group(
        'moment',
        {},

        hor_group(
          nil,
          {Columns = 2},

          text_label_ra('year'),
          input_box('', 'moment_year'),

          text_label_ra('passed year 2099'),
          checkbox(nil, false, 'moment_is_next_century', {MinWidth = 40}),

          text_label_ra('month'),
          input_box('', 'moment_month'),

          text_label_ra('date'),
          input_box('', 'moment_date'),

          text_label_ra('day of week (dow)'),
          input_box('', 'moment_dow'),

          text_label_ra('hour'),
          input_box('', 'moment_hour'),

          text_label_ra('use AM/PM format'),
          checkbox(nil, false, 'moment_is_12h_format'),

          text_label_ra('minute'),
          input_box('', 'moment_minute'),

          text_label_ra('second'),
          input_box('', 'moment_second')
        ),

        hor_group(
          'representation',
          {},
          text_label('', {Id = 'moment_presentation', MinWidth = 190})
        )
      )
  end
