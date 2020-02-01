local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')
local text_label = request('!.frontend.tekui.text_label')
local text_label_ra = request('!.frontend.tekui.text_label_ra')
local input_box = request('!.frontend.tekui.input_box')
local checkbox = request('!.frontend.tekui.checkbox')

local correct_checkboxes = request('^.correct_checkboxes')

local update_alarm_1_multiplicity =
  function(app)
    local checkboxes =
      {
        'alarm_1_ignore_date_dow',
        'alarm_1_ignore_hour',
        'alarm_1_ignore_minute',
        'alarm_1_ignore_second',
      }
    correct_checkboxes(app, checkboxes)
  end

return
  function(self)
    return
      ver_group(
        '1',
        {},

        hor_group(
          'multiplicity',
          {Columns = 2},

          text_label_ra('ignore date/dow'),
          checkbox(
            '', false, 'alarm_1_ignore_date_dow',
            {onSelect = update_alarm_1_multiplicity}
          ),

          text_label_ra('ignore hour'),
          checkbox(
            '', false, 'alarm_1_ignore_hour',
            {onSelect = update_alarm_1_multiplicity}
          ),

          text_label_ra('ignore minute'),
          checkbox(
            '', false, 'alarm_1_ignore_minute',
            {onSelect = update_alarm_1_multiplicity}
          ),

          text_label_ra('ignore second'),
          checkbox(
            '', false, 'alarm_1_ignore_second',
            {onSelect = update_alarm_1_multiplicity}
          )
        ),

        hor_group(
          'offset',
          {Columns = 2},

          text_label_ra('date/dow'),
          input_box('', 'alarm_1_date_dow'),

          text_label_ra('is date, not dow'),
          checkbox('', false, 'alarm_1_is_date_not_dow'),

          text_label_ra('hour'),
          input_box('', 'alarm_1_hour'),

          text_label_ra('use AM/PM format'),
          checkbox('', false, 'alarm_1_is_12h_format'),

          text_label_ra('minute'),
          input_box('', 'alarm_1_minute'),

          text_label_ra('second'),
          input_box('', 'alarm_1_second')
        ),

        hor_group(
          nil,
          {Columns = 2},

          text_label_ra('enable output'),
          checkbox('', false, 'alarm_1_enabled'),

          text_label_ra('occurred'),
          checkbox('', false, 'alarm_1_occurred')
        ),

        hor_group(
          'representation',
          {},
          text_label('', {Id = 'alarm_1_presentation'})
        )
      )
  end
