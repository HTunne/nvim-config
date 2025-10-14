return {
  src = 'https://github.com/tpope/vim-dispatch',
  data = {
    dep_of = {
      'vim-dispatch-neovim',
    },
    after = function()
      vim.keymap.set('n', '<leader>rm', '<cmd>Make<CR>', { desc = 'make' })
      vim.keymap.set('n', '<leader>rs', function()
        vim.cmd('Dispatch ' .. vim.g.dispatch)
      end, { desc = 'dispatch' })
      vim.keymap.set('n', '<leader>rr', function()
        vim.cmd('Start ' .. vim.g.dispatch)
      end, { desc = 'start dispatch' })
    end,
  },
}
