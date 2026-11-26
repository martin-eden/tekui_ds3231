-- Create handler to adjust alarm flags

--[[
  Author: Martin Eden
  Last mod.: 2026-11-26
]]

--[[
  Generate checkbox handler to:
    Correct other alarm flags in group to make them fit good alarm
    flags in datasheet.

  Reason is simple: datasheet allows only subset of all alarm time
  flags.

  Rule is that when any/spec selector is set to "spec" - all
  sub- time granularities must be set to "spec" also. And when
  selector is set to "any" - all super- time granularities must
  be set to "any" also.

  Table with ordered list of names of time granularities passed as
  <checkboxes>. Also this table have +/-1 integer <.NextOffset>
  to move to next element.
]]

local tekui = require('tek.ui')

return
  function(checkboxes)
    assert_table(checkboxes)
    assert_integer(checkboxes.NextOffset)

    return
      function(tui_el)
        -- Run base handler first.
        tekui.RadioButton.onSelect(tui_el)

        -- If event emerged from code, not from user actions, let it go.
        if _G.is_loading_raw_data then
          return
        end

        -- No fancy functionality when radio button is unselected.
        if not tui_el.Selected then
          return
        end

        local our_id = tui_el.Id
        local our_index
        for i = 1, #checkboxes do
          if (checkboxes[i] == our_id) then
            our_index = i
            break
          end
        end
        assert(our_index)

        local next_index = our_index + checkboxes.NextOffset
        local next_id = checkboxes[next_index]
        if not next_id then
          return
        end
        --[[
          onSelect() handler will be executed. Handler is we.
          So we will go to this point of code but with another checkbox.
        --]]
        tui_el:getById(next_id):setValue('Selected', true)
      end
  end

--[[
  2020 #
  2026 #
]]
