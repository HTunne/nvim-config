return {
  'romgrk/barbar.nvim',
  lazy = false,
  dependancies = {
    'nvim-tree/nvim-web-devicons',
    'lewis6991/gitsigns.nvim',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    auto_hide = 1,
  },
  keys = {
    { '<A-h>', '<cmd>BufferPrevious<cr>', desc = 'goto previous buffer' },
    { '<A-left>', '<cmd>BufferPrevious<cr>', desc = 'goto previous buffer' },
    { '<A-l>', '<cmd>BufferNext<cr>', desc = 'goto next buffer' },
    { '<A-right>', '<cmd>BufferNext<cr>', desc = 'goto next buffer' },

    -- Re-order to previous/next
    { '<A-H>', '<cmd>BufferMovePrevious<cr>', desc = 'move buffer left' },
    { '<A-S-left>', '<cmd>BufferMovePrevious<cr>', desc = 'move buffer left' },
    { '<A-L>', '<cmd>BufferMoveNext<cr>', desc = 'move buffer right' },
    { '<A-S-right>', '<cmd>BufferMoveNext<cr>', desc = 'move buffer right' },

    -- Goto buffer in position...
    { '<A-1>', '<cmd>BufferGoto 1<cr>', desc = 'goto buffer 1' },
    { '<A-2>', '<cmd>BufferGoto 2<cr>', desc = 'goto buffer 2' },
    { '<A-3>', '<cmd>BufferGoto 3<cr>', desc = 'goto buffer 3' },
    { '<A-4>', '<cmd>BufferGoto 4<cr>', desc = 'goto buffer 4' },
    { '<A-5>', '<cmd>BufferGoto 5<cr>', desc = 'goto buffer 5' },
    { '<A-6>', '<cmd>BufferGoto 6<cr>', desc = 'goto buffer 6' },
    { '<A-7>', '<cmd>BufferGoto 7<cr>', desc = 'goto buffer 7' },
    { '<A-8>', '<cmd>BufferGoto 8<cr>', desc = 'goto buffer 8' },
    { '<A-9>', '<cmd>BufferGoto 9<cr>', desc = 'goto buffer 9' },
    { '<A-0>', '<cmd>BufferLast<cr>', desc = 'goto last buffer' },

    -- Close buffer
    { '<A-q>', '<cmd>BufferClose<cr>', desc = 'close buffer' },

    -- Wipeout buffer
    { '<A-w>', '<cmd>BufferWipeout<cr>', desc = 'buffer wipeout' },

    -- Close commands
    { '<A-f>', '<cmd>BufferCloseAllButCurrent<cr>', desc = 'close all but current buffer' },
    { '<A->>', '<cmd>BufferCloseBuffersLeft<cr>', desc = 'close buffers left' },
    { '<A-<>', '<cmd>BufferCloseBuffersRight<cr>', desc = 'close buffers right' },

    -- Magic buffer-picking mode
    { '<A-p>', '<cmd>BufferPick<cr>', desc = 'pick buffer' },

    -- Sort automatically by...
    { '<leader>bb', '<cmd>BufferOrderByBufferNumber<cr>', desc = 'sort buffers by number' },
    { '<leader>bd', '<cmd>BufferOrderByDirectory<cr>', desc = 'sort buffers by dir' },
    { '<leader>bl', '<cmd>BufferOrderByLanguage<cr>', desc = 'sort buffers by language' },
  },
}
