return {
  'folke/trouble.nvim',
  config = true,
  keys = {
    { '<leader>tt', '<cmd>TroubleToggle<CR>', 'trouble toggle' },
    { '<leader>tr', '<cmd>TroubleRefresh<CR>', 'trouble refresh' },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
