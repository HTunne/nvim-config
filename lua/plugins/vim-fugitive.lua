return {
  {
    'tpope/vim-fugitive',
    cmd = 'Git',
  },
  {
    'wcascades/vim-fugitive-toggle',
    dependencies = {
      'tpope/vim-fugitive',
    },
    keys = {
      { '<leader>g', [[<cmd>lua require('vim-fugitive-toggle').toggle()<cr>]], desc = 'toggle Git' },
    },
  },
}
