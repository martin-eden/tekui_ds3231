-- Represent next alarm moment in human-friendly string

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

local add_to_list = request('!.concepts.list.add_item')

local get_hms_str
do
  local to_two_dig_str = request('^.convert.internals.to_two_digits_str')
  local list_to_str = request('!.concepts.list.to_string')
  get_hms_str =
    function(alarm, has_seconds)
      local result = { }

      local hh
      if not alarm.ignore_hour then
        hh = to_two_dig_str(alarm.hour)
      else
        hh = 'xx'
      end
      add_to_list(result, hh)

      local mm
      if not alarm.ignore_minute then
        mm = to_two_dig_str(alarm.minute)
      else
        mm = 'xx'
      end
      add_to_list(result, mm)

      if has_seconds then
        local ss
        if not alarm.ignore_second then
          ss = to_two_dig_str(alarm.second)
        else
          ss = 'xx'
        end
        add_to_list(result, ss)
      end

      return list_to_str(result, ':')
    end
end

local str_format = string.format
local glue_words = request('!.concepts.words.to_string')

return
  function(alarm)
    --[[
      One of the alarm records don't have ".ignore_second" field.
    ]]

    local has_seconds = is_boolean(alarm.ignore_second)

    local result = { }

    if alarm.occurred then
      add_to_list(result, '[x]')
    else
      add_to_list(result, '[·]')
    end

    add_to_list(result, 'at')

    if not alarm.ignore_dateday then
      if alarm.is_day then
        add_to_list(result, 'day')
      else
        add_to_list(result, 'date')
      end

      add_to_list(result, str_format('%d,', alarm.dateday))
    end

    add_to_list(result, get_hms_str(alarm, has_seconds))

    return glue_words(result)
  end

--[[
  2020 #
  2026 # # #
]]
