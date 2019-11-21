local tui = require('tek.ui')

return
  function(app, our_checkboxes)
    local stock_onSelect = tui.CheckMark.onSelect
    stock_onSelect(app)

    if G_RAW_VALUES_LOAD then
      return
    end

    local our_id = app.Id
    local is_selected = app.Selected

    assert_string(our_id)
    assert_boolean(is_selected)
    assert_table(our_checkboxes)

    local our_index
    for i, id in ipairs(our_checkboxes) do
      if (id == our_id) then
        our_index = i
        break
      end
    end
    assert(our_index)

    --[[
      Find first checkbox in our group which value needs change
      and change its value. Checkbox handler will be executed and
      we end up in same point but with <our_id> from that checkbox.
      So we "break" in for-loop as recursion will do same job.
    ]]
    if is_selected then
      for i = our_index - 1, 1, -1 do
        local id = our_checkboxes[i]
        local checkbox = app:getById(id)
        if not checkbox.Selected then
          checkbox:setValue('Selected', true)
          break
        end
      end
    else
      for i = our_index + 1, #our_checkboxes do
        local id = our_checkboxes[i]
        local checkbox = app:getById(id)
        if checkbox.Selected then
          app:getById(id):setValue('Selected', false)
          break
        end
      end
    end
  end
