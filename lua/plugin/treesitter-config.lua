------------------
--  treesitter  --
------------------
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main"
    },
}

local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = {
    'bash',
    'bibtex',
    'c',
    'cpp',
    'css',
    'html',
    'javascript',
    'json',
    'latex',
    'lua',
    'python',
    'regex',
    'rust',
    'scss',
    'toml',
    'typescript',
    'vue',
    'norg'
  },
  highlight = {enable = true},
  indent = {enable = true},
}
