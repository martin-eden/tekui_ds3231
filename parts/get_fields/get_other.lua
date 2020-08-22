--[[
  Create part of RTC record for "other" page values.
]]

local prefix_args = request('!.function.prefix_args')
local get_checkbox_stock = request('!.frontend.tekui.get_checkbox')
local get_input_number_stock = request('!.frontend.tekui.get_input_number')

return
  function(app)
    local get_checkbox = prefix_args(get_checkbox_stock, app)
    local get_input_number = prefix_args(get_input_number_stock, app)

    local get_wave_freq =
      function()
        local freqs = {1, 1024, 4096, 8192}
        local freq_selected
        for i, cur_freq in ipairs(freqs) do
          if get_checkbox('wave_freq_' .. tostring(cur_freq)) then
            freq_selected = cur_freq
            break
          end
        end
        assert(freq_selected)
        return freq_selected
      end

    local result =
      {
        at_battery =
          {
            allow_wave_output = get_checkbox('allow_wave_output'),
            stop_clock = get_checkbox('stop_clock'),
            clock_was_stopped = get_checkbox('clock_was_stopped'),
          },
        wave_freq = get_wave_freq(),
        output_alarms_not_wave = get_checkbox('output_alarms_not_wave'),
        enable_wave_32k = get_checkbox('enable_wave_32k'),
        clock_speed = get_input_number('clock_speed'),
        temperature = get_input_number('temperature'),
        get_temperature = get_checkbox('get_temperature'),
        is_busy = get_checkbox('is_busy'),
      }

    return result
  end
