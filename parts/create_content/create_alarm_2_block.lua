local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')
local text_label = request('!.frontend.tekui.text_label')
local text_label_ra = request('!.frontend.tekui.text_label_ra')
local input_box = request('!.frontend.tekui.input_box')
local checkbox = request('!.frontend.tekui.checkbox')

local correct_checkboxes = request('^.correct_checkboxes')

local update_alarm_2_multiplicity =
  function(app)
    local checkboxes =
      {
        'alarm_2_ignore_date_dow',
        'alarm_2_ignore_hour',
        'alarm_2_ignore_minute',
      }
    correct_checkboxes(app, checkboxes)
  end

return
  function(self)
    return
      ver_group(
        '2',
        {},

        hor_group(
          'multiplicity',
          {Columns = 2},

          text_label_ra('ignore date/dow'),
          checkbox(
            '', false, 'alarm_2_ignore_date_dow',
            {onSelect = update_alarm_2_multiplicity}
          ),

          text_label_ra('ignore hour'),
          checkbox(
            '', false, 'alarm_2_ignore_hour',
            {onSelect = update_alarm_2_multiplicity}
          ),

          text_label_ra('ignore minute'),
          checkbox(
            '', false, 'alarm_2_ignore_minute',
            {onSelect = update_alarm_2_multiplicity}
          )
        ),

        hor_group(
          'offset',
          {Columns = 2},

          text_label_ra('date/dow'),
          input_box('', 'alarm_2_date_dow'),

          text_label_ra('is date, not dow'),
          checkbox('', false, 'alarm_2_is_date_not_dow'),

          text_label_ra('hour'),
          input_box('', 'alarm_2_hour'),

          text_label_ra('use AM/PM format'),
          checkbox('', false, 'alarm_2_is_12h_format'),

          text_label_ra('minute'),
          input_box('', 'alarm_2_minute')
        ),

        hor_group(
          nil,
          {Columns = 2},

          text_label_ra('enable output'),
          checkbox('', false, 'alarm_2_enabled'),

          text_label_ra('occurred'),
          checkbox('', false, 'alarm_2_occurred')
        ),

        hor_group(
          'representation',
          {},
          text_label('', {Id = 'alarm_2_presentation'})
        )
      )
  end
