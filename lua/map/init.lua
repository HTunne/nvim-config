-----------
--  map  --
-----------
local wk = require("which-key")

wk.register({
  -- ["<space>"] = require('map.easymotion'),
  ["<space>"] = require('map.hop'),
  c =  { '<cmd>noh<CR>', 'clear highlights' },
  o =  { 'm`o<Esc>0D``', 'newline below' },
  s =  { '<cmd>set spell spelllang=en_gb<CR>', 'set spell' },
  e =  { '<cmd>NvimTreeToggle<CR>', 'open nvim tree' },
  w = require('map.vimwiki'),
  l = require('map.lsp'),
  p = require('map.telescope'),
  j = require('map.jupyter'),
  h = require('map.gitsigns'),
  d = require('map.dap'),
}, { prefix = "<leader>" })

wk.register(require('map.barbar'))
