return {
  'NeogitOrg/neogit',
  cmd = 'Neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'sindrets/diffview.nvim',
  },
  config = true,
  keys = {
    {
      '<leader>g',
      function()
        require('neogit').open()
      end,
      desc = 'open neogit',
    },
  },
}
