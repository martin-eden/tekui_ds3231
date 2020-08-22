return
  function(self)
    return
      function(tui_self)
        self:set_fields(tui_self, self.rtc_handler:load_rtc())
      end
  end
