--[[
  Return function to save values from input fields to device.

  This function saves values only from current selected tab page.
]]

return
  function(self)
    local get_our_data =
      -- Select part of data to save depending of tab page:
      function(app)
        local result = {}

        local tabs_pane = app:getById('tabs_pane')
        local tab_no = tabs_pane.PageNumber
        local tab_name = tabs_pane.PageCaptions[tab_no]

        local interface_data = self:get_fields(app)
        -- Sorry for hardcoded page names:
        if (tab_name == 'moment') then
          result.moment = interface_data.moment
        elseif (tab_name == 'alarm 1') then
          result.alarm_1 = interface_data.alarm_1
        elseif (tab_name == 'alarm 2') then
          result.alarm_2 = interface_data.alarm_2
        elseif (tab_name == 'other') then
          result = interface_data
          result.moment = nil
          result.alarm = nil
        else
          error(('Unknown tab name "%s".'):format(tab_name))
        end

        return result
      end

    return
      function(app)
        local device_data = self.rtc_handler:load_rtc()
        local changes = get_our_data(app)
        local data_to_save = new(device_data, changes)

        self.rtc_handler:save_rtc(data_to_save)
        self:set_fields(app, self.rtc_handler:load_rtc())
      end
  end
