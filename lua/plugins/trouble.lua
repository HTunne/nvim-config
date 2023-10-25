return {
  'folke/trouble.nvim',
  config = true,
  keys = {
    { '<leader>t', '<cmd>Trouble<CR>', 'trouble' },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
