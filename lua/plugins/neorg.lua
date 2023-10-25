return {
  'nvim-neorg/neorg',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neorg/neorg-telescope',
  },
  build = ':Neorg sync-parsers',
  opts = {
    -- configuration here
    logger = {
      -- level = 'trace', -- Show trace, info, warning, error and fatal messages
    },
    load = {
      ['core.defaults'] = {},
      ['core.concealer'] = {
        config = {
          icon_preset = 'diamond',
        },
      },
      ['core.completion'] = {
        config = {
          engine = 'nvim-cmp',
        },
      },
      ['core.dirman'] = {
        config = {
          workspaces = {
            work = '~/norg/work',
            home = '~/norg/home',
          },
        },
      },
      ['core.integrations.telescope'] = {},
    },
  },
}
