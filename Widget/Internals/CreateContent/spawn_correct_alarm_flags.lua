-- Create handler to adjust alarm flags

--[[
  Author: Martin Eden
  Last mod.: 2026-04-28
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
  <Checkboxes>. Also this table have +/-1 integer <.NextOffset>
  to move to next element.
]]

-- Import:
local TekUi = require('tek.ui')

local adjust_alarms =
  function(Checkboxes)
    assert_table(Checkboxes)
    assert_integer(Checkboxes.NextOffset)
    return
      function(TuiElem)
        -- Run base handler first.
        TekUi.RadioButton.onSelect(TuiElem)

        -- If event emerged from code, not from user actions, let it go.
        if _G.IsLoadingRawValues then
          return
        end

        -- No fancy functionality when radio button is unselected.
        if not TuiElem.Selected then
          return
        end

        local our_id = TuiElem.Id
        local our_index
        for i = 1, #Checkboxes do
          if (Checkboxes[i] == our_id) then
            our_index = i
            break
          end
        end
        assert(our_index)

        local next_index = our_index + Checkboxes.NextOffset
        local next_id = Checkboxes[next_index]
        if not next_id then
          return
        end
        --[[
          onSelect() handler will be executed. Handler is we.
          So we will go to this point of code but with another checkbox.
        --]]
        TuiElem:getById(next_id):setValue('Selected', true)
      end
  end

-- Export:
return adjust_alarms

--[[
  2020 #
  2026-04-28
]]
