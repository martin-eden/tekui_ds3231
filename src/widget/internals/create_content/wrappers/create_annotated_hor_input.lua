-- [TekUi] Create input box grouped with annotation text at right

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

--[[
  Input structure

    1 name [s] -- name of input box
    2 width [i] -- width of input box in pixels
    3 description [s] -- annotation text
]]

local create_input_box = request('!.frontend.tekui.create_input_box')
local create_text_label = request('create_text_label')
local create_hor_group = request('!.frontend.tekui.create_hor_group')

return
  function(name, width, description)
    return
      create_hor_group(
        {
          Contents =
            {
              create_input_box(name, { Width = width }),
              create_text_label(
                {
                  text = description,
                  Overrides = { Style = 'text-align: left' },
                }
              ),
            },
        }
      )
  end

--[[
  2026 # #
]]
