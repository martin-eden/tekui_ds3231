--[[
  Special color for checkboxes for special device flags.

  Some bits in device have special meaning or special behavior.
  We represent checkboxes for non-standard color for better UX.

  Unfortunately in TekUI there is no simple way to change font color
  of CheckMark. This approach (setting Application.AuthorStyles
  string) was given to me by Timm Mueller, author if TekUI, in
  personal email message 2020-09.
]]

return
  [[
#is_busy {color: #0049B7;}
#is_busy:focus {color: #0049B7;}
#is_busy:hover {color: #0049B7;}
#is_busy:active {color: #0049B7;}

#alarm_1_occurred {color: #008080;}
#alarm_1_occurred:focus {color: #008080;}
#alarm_1_occurred:hover {color: #008080;}
#alarm_1_occurred:active {color: #008080;}

#alarm_2_occurred {color: #008080;}
#alarm_2_occurred:focus {color: #008080;}
#alarm_2_occurred:hover {color: #008080;}
#alarm_2_occurred:active {color: #008080;}
]]
