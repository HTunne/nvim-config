return {
  'danymat/neogen',
  opts = {
    snippet_engine = 'luasnip',
  },
  ft = {
    'cpp',
  },
  keys = {
    { '<leader>x', '<CMD>Neogen<CR>', desc = 'Document function/class' },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
}
