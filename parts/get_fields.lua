--[[
  Store GUI values to DS3231 state.
]]

return
  function(app)
    assert_table(app)

    local get_input_text =
      function(input_box_id)
        local input_box = app:getById(input_box_id)
        assert_table(input_box)
        return input_box:getText()
      end

    local get_input_number =
      function(input_box_id)
        return tonumber(get_input_text(input_box_id))
      end

    local get_checkbox =
      function(checkbox_id)
        local checkbox = app:getById(checkbox_id)
        assert_table(checkbox)
        return checkbox.Selected
      end

    local get_custom_wave_freq =
      function()
        local freqs = {1, 1024, 4096, 8192}
        local freq_selected
        for i, cur_freq in ipairs(freqs) do
          if get_checkbox('custom_wave_freq_' .. tostring(cur_freq)) then
            freq_selected = cur_freq
            break
          end
        end
        assert(freq_selected)
        return freq_selected
      end

    local result =
      {
        moment =
          {
            year = get_input_number('moment_year'),
            is_next_century = get_checkbox('moment_is_next_century'),
            month = get_input_number('moment_month'),
            date = get_input_number('moment_date'),
            dow = get_input_number('moment_dow'),
            hour = get_input_number('moment_hour'),
            is_12h_format = get_checkbox('moment_is_12h_format'),
            minute = get_input_number('moment_minute'),
            second = get_input_number('moment_second'),
          },
        alarm =
          {
            {
              enabled = get_checkbox('alarm_1_enabled'),
              date_dow = get_input_number('alarm_1_date_dow'),
              is_date_not_dow = get_checkbox('alarm_1_is_date_not_dow'),
              ignore_date_dow = get_checkbox('alarm_1_ignore_date_dow'),
              hour = get_input_number('alarm_1_hour'),
              is_12h_format = get_checkbox('alarm_1_is_12h_format'),
              ignore_hour = get_checkbox('alarm_1_ignore_hour'),
              minute = get_input_number('alarm_1_minute'),
              ignore_minute = get_checkbox('alarm_1_ignore_minute'),
              second = get_input_number('alarm_1_second'),
              ignore_second = get_checkbox('alarm_1_ignore_second'),
              occurred = get_checkbox('alarm_1_occurred'),
            },
            {
              enabled = get_checkbox('alarm_2_enabled'),
              date_dow = get_input_number('alarm_2_date_dow'),
              is_date_not_dow = get_checkbox('alarm_2_is_date_not_dow'),
              ignore_date_dow = get_checkbox('alarm_2_ignore_date_dow'),
              hour = get_input_number('alarm_2_hour'),
              is_12h_format = get_checkbox('alarm_2_is_12h_format'),
              ignore_hour = get_checkbox('alarm_2_ignore_hour'),
              minute = get_input_number('alarm_2_minute'),
              ignore_minute = get_checkbox('alarm_2_ignore_minute'),
              occurred = get_checkbox('alarm_2_occurred'),
            },
          },
        at_battery =
          {
            clock_disabled = get_checkbox('clock_disabled'),
            custom_wave_output_allowed = get_checkbox('custom_wave_output_allowed'),
          },
        custom_wave_freq = get_custom_wave_freq(),
        output_alarms_not_custom_wave = get_checkbox('output_alarms_not_custom_wave'),
        fixed_wave_32k_enabled = get_checkbox('fixed_wave_32k_enabled'),
        clock_speed = get_input_number('clock_speed'),
        temperature = get_input_number('temperature'),
        clock_was_stopped = get_checkbox('clock_was_stopped'),
        converting_temperature = get_checkbox('converting_temperature'),
        is_busy = get_checkbox('is_busy'),
      }

    return result
  end
