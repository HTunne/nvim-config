return {
  [']c'] = { '<cmd>Gitsigns next_hunk<CR>' },
  ['[c'] = { '<cmd>Gitsigns prev_hunk<CR>' },
  ['<leader>'] = {
    ['h'] = {
      name = '+gitsigns',
      ['s'] = { '<cmd>Gitsigns stage_hunk<CR>', 'stage hunk' },
      ['u'] = { '<cmd>Gitsigns undo_stage_hunk<CR>', 'undo stage hunk' },
      ['r'] = { '<cmd>Gitsigns reset_hunk<CR>', 'reset hunk' },
      ['p'] = { '<cmd>Gitsigns preview_hunk<CR>', 'preview hunk' },
      ['b'] = {
        function()
          require('gitsigns').blame_line({ full = true })
        end,
        'blame line',
      },
      ['R'] = { '<cmd>Gitsigns reset_buffer<CR>', 'reset buffer' },
      ['S'] = { '<cmd>Gitsigns stage_buffer<CR>', 'stage buffer' },
      ['d'] = { '<cmd>Gitsigns diffthis<CR>', 'diff this' },
      ['D'] = {
        function()
          require('gitsigns').diffthis('~')
        end,
        'diff this home',
      },
      ['tb'] = { '<cmd>Gitsigns toggle_current_line_blame<CR>', 'toggle current line blame' },
    },
  },
}
