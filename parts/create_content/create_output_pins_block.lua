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

local correct_flags_any_2 =
  spawn_correct_alarm_flags(
    {
      'alarm_2_day_any',
      'alarm_2_hour_any',
      'alarm_2_minute_any',
      next_offset = -1,
    }
  )

local correct_flags_spec_2 =
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

local create_any_rb_2 =
  function(elem_id)
    return
      radio_mark(
        'any', nil, elem_id, {onSelect = correct_flags_any_2}
      )
  end

local create_spec_rb =
  function(elem_id)
    return
      radio_mark(
        'specific', nil, elem_id, {onSelect = correct_flags_spec}
      )
  end

local create_spec_rb_2 =
  function(elem_id)
    return
      radio_mark(
        'specific', nil, elem_id, {onSelect = correct_flags_spec_2}
      )
  end

return
  function(self)
    return
      ver_group(
        nil,
        {Width = self.ui_width},
        hor_group(
          nil,
          {Columns = 2},
          checkbox('alarm 1', false, 'alarm_1_enabled'),
          ver_group(
            '',
            {},

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
            checkbox('day of month, not week', false, 'alarm_1_is_date_not_dow')
          ),
          checkbox('alarm 2', false, 'alarm_2_enabled'),
          ver_group(
            '',
            {},
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
            checkbox('occurred', false, 'alarm_2_occurred'),
            hor_group(
              nil,
              {},
              ver_group(
                'day',
                {Width = 'free'},
                create_any_rb_2('alarm_2_day_any'),
                create_spec_rb_2('alarm_2_day_spec'),
                input_box('', 'alarm_2_date_dow')
              ),
              ver_group(
                'hour',
                {Width = 'free'},
                create_any_rb_2('alarm_2_hour_any'),
                create_spec_rb_2('alarm_2_hour_spec'),
                input_box('', 'alarm_2_hour')
              ),
              ver_group(
                'minute',
                {Width = 'free'},
                create_any_rb_2('alarm_2_minute_any'),
                create_spec_rb_2('alarm_2_minute_spec'),
                input_box('', 'alarm_2_minute')
              )
            ),
            checkbox('day of month, not week', false, 'alarm_2_is_date_not_dow')
          )
        )
      )
  end
