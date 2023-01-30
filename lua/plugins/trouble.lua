return {
  'folke/trouble.nvim',
  config = true,
  keys = {
    { '<leader>t', '<cmd>Trouble<CR>', 'trouble' },
  },
  dependancies = {
    'nvim-tree/nvim-web-devicons',
  },
}
