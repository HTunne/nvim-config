return {
  'nvim-neorg/neorg',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
  build = ':Neorg sync-parsers',

  opts = {
    -- configuration here
    load = {
      ['core.defaults'] = {},
      ['core.norg.dirman'] = {
        config = {
          workspaces = {
            work = '~/norg/work',
            home = '~/norg/home',
          },
        },
      },
    },
  },
}
