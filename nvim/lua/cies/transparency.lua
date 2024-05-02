--[[

 ______   __   ______   ______    
/\  ___\ /\ \ /\  ___\ /\  ___\   
\ \ \____\ \ \\ \  __\ \ \___  \  
 \ \_____\\ \_\\ \_____\\/\_____\ 
  \/_____/ \/_/ \/_____/ \/_____/ 

  --]]
require("transparent").setup({
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {
    "NormalFloat",
    "NvimTreeNormal"
  },
  exclude_groups = {},
})
