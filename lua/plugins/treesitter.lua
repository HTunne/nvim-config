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
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        sync_install = false,
        auto_install = true,
        -- List of parsers to ignore installing (or "all")
        ignore_install = { 'javascript' },
        highlight = { enable = true },
        indent = { enable = true },
        modules = {},
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn', -- set to `false` to disable one of the mappings
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
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
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V',  -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
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
      })
    end,
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
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependancies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
