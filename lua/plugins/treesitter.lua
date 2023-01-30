------------------
--  treesitter  --
------------------
--
-- local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
--
-- parser_configs.norg = {
--   install_info = {
--     url = 'https://github.com/vhyrro/tree-sitter-norg',
--     files = { 'src/parser.c' },
--     branch = 'main',
--   },
-- }

return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    opts = {
      ensure_installed = 'all',
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-backspace>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependancies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { separator = '-' },
  },
  {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
    dependancies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'lewis6991/spellsitter.nvim',
    dependancies = { 'nvim-treesitter/nvim-treesitter' },
    config = true,
  },
}
