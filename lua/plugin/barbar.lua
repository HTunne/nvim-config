return {
  src = 'https://github.com/romgrk/barbar.nvim',
  data = {
    before = function()
      vim.g.barbar_auto_setup = false
    end,
    after = function()
      require('barbar').setup({
        auto_hide = 1,
      })
      vim.keymap.set('n', '<A-h>', '<cmd>BufferPrevious<cr>', { desc = 'goto previous buffer' })
      vim.keymap.set('n', '<A-left>', '<cmd>BufferPrevious<cr>', { desc = 'goto previous buffer' })
      vim.keymap.set('n', '<A-l>', '<cmd>BufferNext<cr>', { desc = 'goto next buffer' })
      vim.keymap.set('n', '<A-right>', '<cmd>BufferNext<cr>', { desc = 'goto next buffer' })

      -- Re-order to previous/next
      vim.keymap.set('n', '<A-H>', '<cmd>BufferMovePrevious<cr>', { desc = 'move buffer left' })
      vim.keymap.set('n', '<A-S-left>', '<cmd>BufferMovePrevious<cr>', { desc = 'move buffer left' })
      vim.keymap.set('n', '<A-L>', '<cmd>BufferMoveNext<cr>', { desc = 'move buffer right' })
      vim.keymap.set('n', '<A-S-right>', '<cmd>BufferMoveNext<cr>', { desc = 'move buffer right' })

      -- Goto buffer in position...
      vim.keymap.set('n', '<A-1>', '<cmd>BufferGoto 1<cr>', { desc = 'goto buffer 1' })
      vim.keymap.set('n', '<A-2>', '<cmd>BufferGoto 2<cr>', { desc = 'goto buffer 2' })
      vim.keymap.set('n', '<A-3>', '<cmd>BufferGoto 3<cr>', { desc = 'goto buffer 3' })
      vim.keymap.set('n', '<A-4>', '<cmd>BufferGoto 4<cr>', { desc = 'goto buffer 4' })
      vim.keymap.set('n', '<A-5>', '<cmd>BufferGoto 5<cr>', { desc = 'goto buffer 5' })
      vim.keymap.set('n', '<A-6>', '<cmd>BufferGoto 6<cr>', { desc = 'goto buffer 6' })
      vim.keymap.set('n', '<A-7>', '<cmd>BufferGoto 7<cr>', { desc = 'goto buffer 7' })
      vim.keymap.set('n', '<A-8>', '<cmd>BufferGoto 8<cr>', { desc = 'goto buffer 8' })
      vim.keymap.set('n', '<A-9>', '<cmd>BufferGoto 9<cr>', { desc = 'goto buffer 9' })
      vim.keymap.set('n', '<A-0>', '<cmd>BufferLast<cr>', { desc = 'goto last buffer' })

      -- Close buffer
      vim.keymap.set('n', '<A-q>', '<cmd>BufferClose<cr>', { desc = 'close buffer' })

      -- Wipeout buffer
      vim.keymap.set('n', '<A-w>', '<cmd>BufferWipeout<cr>', { desc = 'buffer wipeout' })

      -- Close commands
      vim.keymap.set('n', '<A-f>', '<cmd>BufferCloseAllButCurrent<cr>', { desc = 'close all but current buffer' })
      vim.keymap.set('n', '<A->>', '<cmd>BufferCloseBuffersLeft<cr>', { desc = 'close buffers left' })
      vim.keymap.set('n', '<A-<>', '<cmd>BufferCloseBuffersRight<cr>', { desc = 'close buffers right' })

      -- Magic buffer-picking mode
      vim.keymap.set('n', '<A-p>', '<cmd>BufferPick<cr>', { desc = 'pick buffer' })

      -- Sort automatically by...
      vim.keymap.set('n', '<leader>bb', '<cmd>BufferOrderByBufferNumber<cr>', { desc = 'sort buffers by number' })
      vim.keymap.set('n', '<leader>bd', '<cmd>BufferOrderByDirectory<cr>', { desc = 'sort buffers by dir' })
      vim.keymap.set('n', '<leader>bl', '<cmd>BufferOrderByLanguage<cr>', { desc = 'sort buffers by language' })
    end,
  },
}
