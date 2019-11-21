local update_moment_presentation = request('update_moment_presentation')
local update_alarm_1_presentation = request('update_alarm_1_presentation')
local update_alarm_2_presentation = request('update_alarm_2_presentation')

return
  function(app)
    update_moment_presentation(app)
    update_alarm_1_presentation(app)
    update_alarm_2_presentation(app)
  end
