return {
  'radenling/vim-dispatch-neovim',
  dependencies = { 'tpope/vim-dispatch' },
  keys = {
    { '<leader>rm', '<cmd>Make<CR>', desc = 'dispatch' },
    {
      '<leader>rs',
      function()
        vim.cmd('Dispatch ' .. vim.g.dispatch)
      end,
      desc = 'dispatch',
    },
    {
      '<leader>rr',
      function()
        vim.cmd('Start ' .. vim.g.dispatch)
      end,
      desc = 'start dispatch',
    },
  },
}
