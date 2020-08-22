local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')
local text_label = request('!.frontend.tekui.text_label')
local input_box = request('!.frontend.tekui.input_box')
local checkbox = request('!.frontend.tekui.checkbox')
local radio_mark = request('!.frontend.tekui.radio_button')

local spawn_correct_alarm_flags = request('spawn_correct_alarm_flags')

local correct_flags_any =
  spawn_correct_alarm_flags(
    {
      'alarm_1_day_any',
      'alarm_1_hour_any',
      'alarm_1_minute_any',
      'alarm_1_second_any',
      next_offset = -1,
    }
  )

local correct_flags_spec =
  spawn_correct_alarm_flags(
    {
      'alarm_1_day_spec',
      'alarm_1_hour_spec',
      'alarm_1_minute_spec',
      'alarm_1_second_spec',
      next_offset = 1,
    }
  )

local create_any_rb =
  function(elem_id)
    return
      radio_mark(
        'any', nil, elem_id, {onSelect = correct_flags_any}
      )
  end

local create_spec_rb =
  function(elem_id)
    return
      radio_mark(
        'specific', nil, elem_id, {onSelect = correct_flags_spec}
      )
  end

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
              Id = 'alarm_1_presentation',
            }
          )
        ),
        checkbox('enable output', false, 'alarm_1_enabled'),
        checkbox('occurred', false, 'alarm_1_occurred'),
        hor_group(
          nil,
          {},
          ver_group(
            'day',
            {Width = 'free'},
            create_any_rb('alarm_1_day_any'),
            create_spec_rb('alarm_1_day_spec'),
            input_box('', 'alarm_1_date_dow')
          ),
          ver_group(
            'hour',
            {Width = 'free'},
            create_any_rb('alarm_1_hour_any'),
            create_spec_rb('alarm_1_hour_spec'),
            input_box('', 'alarm_1_hour')
          ),
          ver_group(
            'minute',
            {Width = 'free'},
            create_any_rb('alarm_1_minute_any'),
            create_spec_rb('alarm_1_minute_spec'),
            input_box('', 'alarm_1_minute')
          ),
          ver_group(
            'second',
            {Width = 'free'},
            create_any_rb('alarm_1_second_any'),
            create_spec_rb('alarm_1_second_spec'),
            input_box('', 'alarm_1_second')
          )
        ),
        checkbox('day of month, not week', false, 'alarm_1_is_date_not_dow'),
        checkbox('AM/PM hour format', false, 'alarm_1_store_hour_in_12h')
      )
  end
