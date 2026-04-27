-- Create button handler

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
]]

local create_button_handler =
  function(Me, handler)
    assert_function(handler)

    return
      function(TekUi_App)
        handler(Me, TekUi_App)
      end
  end

-- Export:
return create_button_handler

--[[
  2026-04-28
]]
