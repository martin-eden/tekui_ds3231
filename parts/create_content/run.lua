local hor_group = request('^.^.tui_tools.hor_group')
local ver_group = request('^.^.tui_tools.ver_group')

local create_moment_block = request('create_moment_block')
local create_alarm_1_block = request('create_alarm_1_block')
local create_alarm_2_block = request('create_alarm_2_block')
local create_misc_block = request('create_misc_block')
local create_actions_block = request('create_actions_block')

return
  function(self)
    return
      ver_group(
        nil,
        {},

        hor_group(
          nil,
          {},

          create_moment_block(self),
          hor_group(
            'alarms',
            {},

            create_alarm_1_block(self),
            create_alarm_2_block(self)
          ),

          create_misc_block(self),
          create_actions_block(self)
        )
      )
  end
