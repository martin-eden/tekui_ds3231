--[[
  Set GUI values according given DS3231 table.
]]

local update_presentations = request('update_presentations.run')

return
  function(app, rtc_rec)
    assert_table(app)
    assert_table(rtc_rec)

    local set_input_text =
      function(input_box_id, text)
        text = tostring(text)
        local input_box = app:getById(input_box_id)
        assert_table(input_box)
        input_box:onEnter()
        input_box:setValue('Text', text)
      end

    local set_checkbox =
      function(checkbox_id, value)
        assert_boolean(value)
        local checkbox = app:getById(checkbox_id)
        assert_table(checkbox)
        checkbox:setValue('Selected', value)
      end

    local set_radio_button = set_checkbox

    G_RAW_VALUES_LOAD = true

    set_input_text('moment_year', rtc_rec.moment.year)
    set_checkbox('moment_is_next_century', rtc_rec.moment.is_next_century)
    set_input_text('moment_month', rtc_rec.moment.month)
    set_input_text('moment_date', rtc_rec.moment.date)
    set_input_text('moment_dow', rtc_rec.moment.dow)
    set_input_text('moment_hour', rtc_rec.moment.hour)
    set_checkbox('moment_is_12h_format', rtc_rec.moment.is_12h_format)
    set_input_text('moment_minute', rtc_rec.moment.minute)
    set_input_text('moment_second', rtc_rec.moment.second)

    set_checkbox('alarm_1_enabled', rtc_rec.alarm[1].enabled)
    set_input_text('alarm_1_date_dow', rtc_rec.alarm[1].date_dow)
    set_checkbox('alarm_1_is_date_not_dow', rtc_rec.alarm[1].is_date_not_dow)
    set_checkbox('alarm_1_ignore_date_dow', rtc_rec.alarm[1].ignore_date_dow)
    set_input_text('alarm_1_hour', rtc_rec.alarm[1].hour)
    set_checkbox('alarm_1_is_12h_format', rtc_rec.alarm[1].is_12h_format)
    set_checkbox('alarm_1_ignore_hour', rtc_rec.alarm[1].ignore_hour)
    set_input_text('alarm_1_minute', rtc_rec.alarm[1].minute)
    set_checkbox('alarm_1_ignore_minute', rtc_rec.alarm[1].ignore_minute)
    set_input_text('alarm_1_second', rtc_rec.alarm[1].second)
    set_checkbox('alarm_1_ignore_second', rtc_rec.alarm[1].ignore_second)
    set_checkbox('alarm_1_occurred', rtc_rec.alarm[1].occurred)

    set_checkbox('alarm_2_enabled', rtc_rec.alarm[2].enabled)
    set_input_text('alarm_2_date_dow', rtc_rec.alarm[2].date_dow)
    set_checkbox('alarm_2_is_date_not_dow', rtc_rec.alarm[2].is_date_not_dow)
    set_checkbox('alarm_2_ignore_date_dow', rtc_rec.alarm[2].ignore_date_dow)
    set_input_text('alarm_2_hour', rtc_rec.alarm[2].hour)
    set_checkbox('alarm_2_is_12h_format', rtc_rec.alarm[2].is_12h_format)
    set_checkbox('alarm_2_ignore_hour', rtc_rec.alarm[2].ignore_hour)
    set_input_text('alarm_2_minute', rtc_rec.alarm[2].minute)
    set_checkbox('alarm_2_ignore_minute', rtc_rec.alarm[2].ignore_minute)
    set_checkbox('alarm_2_occurred', rtc_rec.alarm[2].occurred)

    local custom_freq_id = 'custom_wave_freq' .. '_' .. rtc_rec.custom_wave_freq
    set_radio_button(custom_freq_id, true)
    set_checkbox('output_alarms_not_custom_wave', rtc_rec.output_alarms_not_custom_wave)

    set_checkbox('fixed_wave_32k_enabled', rtc_rec.fixed_wave_32k_enabled)

    set_checkbox('clock_disabled', rtc_rec.at_battery.clock_disabled)
    set_checkbox('custom_wave_output_allowed', rtc_rec.at_battery.custom_wave_output_allowed)

    set_input_text('clock_speed', rtc_rec.clock_speed)

    set_input_text('temperature', rtc_rec.temperature)
    set_checkbox('clock_was_stopped', rtc_rec.clock_was_stopped)
    set_checkbox('converting_temperature', rtc_rec.converting_temperature)
    set_checkbox('is_busy', rtc_rec.is_busy)

    G_RAW_VALUES_LOAD = false

    update_presentations(app)
  end
