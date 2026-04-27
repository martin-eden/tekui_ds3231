-- Create "other" interface block

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

--[[
  Beware, names of elements of "freq" block are used in [get_fields].
]]

-- Imports:
local func_get_temp = request('^.funcs.get_temp')
local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')
local one_of_el = request('!.frontend.tekui.radio_button')
local text_label = request('!.frontend.tekui.text_label')
local text_label_ra = request('!.frontend.tekui.text_label_ra')
local text_label_la = request('!.frontend.tekui.text_label_la')
local input_box = request('!.frontend.tekui.input_box')
local checkbox = request('!.frontend.tekui.checkbox')
local create_button = request('wrappers.create_button')

local GetTemp_Btn =
  {
    Name = 'Measure _temperature immediately',
    Handler = func_get_temp,
  }

local create_other_block =
  function(Me)
    return
      ver_group(
        nil,
        { Width = Me.ui_width },
        hor_group(
          '',
          {},
          text_label(
            '',
            {
              Style = Me.ui_status_style,
              Id = 'other_presentation',
            }
          )
        ),
        hor_group(
          'square wave output',
          {},
          hor_group(
            'freq (Hz)',
            { Columns = 2, Width = 'free' },
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
            input_box('', 'clock_speed', { Width = 50 }),
            text_label_la('clock limit adjustment [-128, 127]')
          ),
          hor_group(
            nil,
            {},
            input_box('', 'temperature', { Width = 50 }),
            text_label_la('temperature')
          ),
          checkbox('get temperature', false, 'get_temperature'),
          checkbox('is busy', false, 'is_busy')
        ),
        create_button(Me, GetTemp_Btn)
      )
  end

-- Export:
return create_other_block

--[[
  2020 #
  2026-04-28
]]
