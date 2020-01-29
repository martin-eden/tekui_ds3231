return
  function(self)
    return
      function(self_2)
        self.rtc_handler:save_rtc(self.get_fields(self_2.Application))
        self.set_fields(self_2.Application, self.rtc_handler:load_rtc())
      end
  end
