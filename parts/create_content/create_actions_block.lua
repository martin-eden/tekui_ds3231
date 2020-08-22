local hor_group = request('!.frontend.tekui.hor_group')
local ver_group = request('!.frontend.tekui.ver_group')
local button = request('!.frontend.tekui.button')

return
  function(self)
    return
      hor_group(
        nil,
        {},
        button('_Load', {onClick = self:spawn_load()}),
        button('_Save', {onClick = self:spawn_save()})
      )
  end
