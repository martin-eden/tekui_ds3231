--[[
  Return function to save values from input fields to device.
]]

return
  function(self)
    return
      function(app)
        local device_data = self.rtc_handler:load_rtc()
        local changes = self:get_fields(app)
        local data_to_save = new(device_data, changes)

        self.rtc_handler:save_rtc(data_to_save)
        self:set_fields(app, self.rtc_handler:load_rtc())
      end
  end
