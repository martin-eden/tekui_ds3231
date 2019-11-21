local get_fields = request('^.get_fields')

return
  function(elem_id, getter)
    assert_string(elem_id)
    assert_function(getter)
    return
      function(self)
        local app = self.Application
        local presentation
        local is_ok, presentation = pcall(getter, get_fields(app))
        if not is_ok then
          presentation = "Can't represent - bad data."
        end
        app:getById(elem_id):setValue('Text', presentation)
      end
  end
