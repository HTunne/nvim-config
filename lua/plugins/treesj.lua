return {
  'Wansmer/treesj',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    use_default_keymaps = false,
  },
  keys = {
    { '<leader>m', function() require('treesj').toggle() end, desc = 'split/join' },
  },
}
