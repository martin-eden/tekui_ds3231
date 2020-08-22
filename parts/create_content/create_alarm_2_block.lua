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
      'alarm_2_day_any',
      'alarm_2_hour_any',
      'alarm_2_minute_any',
      next_offset = -1,
    }
  )

local correct_flags_spec =
  spawn_correct_alarm_flags(
    {
      'alarm_2_day_spec',
      'alarm_2_hour_spec',
      'alarm_2_minute_spec',
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
              Id = 'alarm_2_presentation',
            }
          )
        ),
        checkbox('enable output', false, 'alarm_2_enabled'),
        checkbox('occurred', false, 'alarm_2_occurred'),
        hor_group(
          nil,
          {},
          ver_group(
            'day',
            {Width = 'free'},
            create_any_rb('alarm_2_day_any'),
            create_spec_rb('alarm_2_day_spec'),
            input_box('', 'alarm_2_date_dow')
          ),
          ver_group(
            'hour',
            {Width = 'free'},
            create_any_rb('alarm_2_hour_any'),
            create_spec_rb('alarm_2_hour_spec'),
            input_box('', 'alarm_2_hour')
          ),
          ver_group(
            'minute',
            {Width = 'free'},
            create_any_rb('alarm_2_minute_any'),
            create_spec_rb('alarm_2_minute_spec'),
            input_box('', 'alarm_2_minute')
          )
        ),
        checkbox('day of month, not week', false, 'alarm_2_is_date_not_dow'),
        checkbox('AM/PM hour format', false, 'alarm_2_store_hour_in_12h')
      )
  end
