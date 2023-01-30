return {
  'stevearc/aerial.nvim',
  dependancies = {
    'nvim-treesitter/nvim-treesitter',
    'neovim/nvim-lspconfig',
  },
  keys = {
    { '<leader>a', '<cmd>AerialToggle!<CR>', desc = 'open aerial' },
    {
      '<leader>pa',
      function()
        local telescope = require('telescope')
        telescope.extensions.aerial.aerial()
      end,
      desc = 'Telescope aerial',
    },
  },
  opts = {
    backends = { 'lsp', 'treesitter' },
    filter_kind = false,
  },
  config = function(_, opts)
    local aerial = require('aerial')
    local telescope = require('telescope')
    aerial.setup(opts)
    telescope.load_extension('aerial')
  end,
}
