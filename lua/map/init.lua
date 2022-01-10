-----------
--  map  --
-----------
local wk = require('which-key')

-- normal mode mappings
wk.register({
  Y = { 'y$', 'yank to end of line' },
  n = { 'nzzzv', 'centre after n' },
  N = { 'Nzzzv', 'centre after N' },
})

-- insert mode mappings
wk.register({
  [','] = { ',<c-g>u', 'set undo breakpoint on ,' },
  ['.'] = { '.<c-g>u', 'set undo breakpoint on .' },
  ['!'] = { '!<c-g>u', 'set undo breakpoint on !' },
  ['?'] = { '?<c-g>u', 'set undo breakpoint on ?' },
}, { mode = 'i' })

-- visual mode mappings
wk.register({
  J = { ":m '>+1<cr>gv=gv", 'move highlighted region down' },
  K = { ":m '<-2<cr>gv=gv", 'move highlighted region up' },
}, { mode = 'v' })

-- leader mappings
wk.register({
  ['<space>'] = require('map.hop'),
  a = { '<cmd>AerialToggle<cr>', 'open aerial' },
  c = { '<cmd>noh<CR>', 'clear highlights' },
  d = require('map.dap'),
  e = { '<cmd>NvimTreeToggle<CR>', 'open nvim tree' },
  f = {
    function()
      if vim.opt.foldcolumn:get() == '1' then
        vim.opt.foldcolumn = '0'
      else
        vim.opt.foldcolumn = '1'
      end
    end,
    'toggle foldcolumn',
  },
  h = require('map.gitsigns'),
  j = { ':m .+1<cr>==', 'move line down' },
  k = { ':m .-2<cr>==', 'move line up' },
  o = { 'm`o<Esc>0D``', 'newline below' },
  p = require('map.telescope'),
  s = { '<cmd>set spell spelllang=en_gb<CR>', 'set spell' },
  t = { '<cmd>Trouble<CR>', 'trouble' },
  w = require('map.vimwiki'),
  y = require('map.jupyter'),
  z = { require('zen-mode').toggle, 'zen mode' },
}, { prefix = '<leader>' })

wk.register(require('map.lsp'))
wk.register(require('map.cmp'))
wk.register(require('map.barbar'))
