local represent_moment = request('represent_moment')
local represent_alarm_1 = request('represent_alarm_1')
local represent_alarm_2 = request('represent_alarm_2')
local represent_other = request('represent_other')

return
  function(self, app)
    local rtc_rec = self:get_fields(app)

    local run_representer =
      function(elem_id, presenter)
        local is_ok, result = pcall(presenter, rtc_rec)
        if not is_ok then
          result = "Can't represent. Bad data?"
        end
        if is_nil(app:getById(elem_id)) then
          -- print('Failed to get app:getById() for ' .. elem_id)
        else
          app:getById(elem_id):setValue('Text', result)
        end
      end

    run_representer('moment_presentation', represent_moment)
    run_representer('alarm_1_presentation', represent_alarm_1)
    run_representer('alarm_2_presentation', represent_alarm_2)
    run_representer('other_presentation', represent_other)
  end
