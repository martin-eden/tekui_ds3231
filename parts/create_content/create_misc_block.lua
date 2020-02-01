local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')
local one_of_el = request('!.frontend.tekui.radio_button')
local text_label_ra = request('!.frontend.tekui.text_label_ra')
local input_box = request('!.frontend.tekui.input_box')
local checkbox = request('!.frontend.tekui.checkbox')

return
  function(self)
    return
      ver_group(
        'other settings and flags',
        {},

        ver_group(
          'custom wave output',
          {},

          hor_group(
            'freq (Hz)',
            {Columns = 4},

            text_label_ra('1'),
            one_of_el('', nil, 'custom_wave_freq_1'),

            text_label_ra('1024'),
            one_of_el('', nil, 'custom_wave_freq_1024'),

            text_label_ra('4096'),
            one_of_el('', nil, 'custom_wave_freq_4096'),

            text_label_ra('8192'),
            one_of_el('', nil, 'custom_wave_freq_8192')
          ),
          hor_group(
            nil,
            {Columns = 2},
            text_label_ra('output alarms, not custom wave'),
            checkbox('', false, 'output_alarms_not_custom_wave')
          )
        ),

        hor_group(
          'at battery',
          {Columns = 2},

          text_label_ra('clock disabled'),
          checkbox(nil, false, 'clock_disabled'),

          text_label_ra('custom wave output enabled'),
          checkbox(nil, false, 'custom_wave_output_allowed')
        ),

        hor_group(
          nil,
          {Columns = 2},

          text_label_ra('32k wave output enabled'),
          checkbox('', false, 'fixed_wave_32k_enabled'),

          text_label_ra('clock speed [-128, 127]'),
          input_box('', 'clock_speed')
        ),

        hor_group(
          'status',
          {Columns = 2},

          text_label_ra('temperature'),
          input_box('', 'temperature', {Width = 'free'}),

          text_label_ra('clock was stopped'),
          checkbox('', false, 'clock_was_stopped'),

          text_label_ra('converting temperature'),
          checkbox('', false, 'converting_temperature'),

          text_label_ra('is busy'),
          checkbox('', false, 'is_busy')
        )
      )
  end
