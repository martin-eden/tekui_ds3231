--[[
  Create "other" interface block for TekUI.

  Beware, names of elements of "freq" block are used in [get_fields].
]]

local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')
local one_of_el = request('!.frontend.tekui.radio_button')
local text_label = request('!.frontend.tekui.text_label')
local text_label_ra = request('!.frontend.tekui.text_label_ra')
local text_label_la = request('!.frontend.tekui.text_label_la')
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
              Id = 'other_presentation',
            }
          )
        ),
        hor_group(
          'square wave output',
          {},
          hor_group(
            'freq (Hz)',
            {Columns = 2, Width = 'free'},
            one_of_el('1', nil, 'wave_freq_1'),
            one_of_el('1024', nil, 'wave_freq_1024'),
            one_of_el('4096', nil, 'wave_freq_4096'),
            one_of_el('8192', nil, 'wave_freq_8192')
          ),
          checkbox(
            'output ALARMS, not wave',
            false,
            'output_alarms_not_wave',
            {Width = 'fill'}
          )
        ),
        ver_group(
          'at battery',
          {},
          checkbox('enable wave output', false, 'allow_wave_output'),
          checkbox('stop clock', false, 'stop_clock'),
          checkbox('clock was stopped', false, 'clock_was_stopped')
        ),
        ver_group(
          nil,
          {},
          checkbox('32k wave output', false, 'enable_wave_32k'),
          hor_group(
            nil,
            {},
            input_box('', 'clock_speed', {Width = 50}),
            text_label_la('clock limit adjustment [-128, 127]')
          ),
          hor_group(
            nil,
            {},
            input_box('', 'temperature', {Width = 50}),
            text_label_la('temperature')
          ),
          checkbox('get temperature', false, 'get_temperature'),
          checkbox('is busy', false, 'is_busy')
        ),
        button(
          'Measure _temperature immediately',
          {onClick = self:spawn_get_temp()}
        )
      )
  end
