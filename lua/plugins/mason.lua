return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
    opts = {
      PATH = "append"
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    opts = {
      ensure_installed = {
        -- arduino
        'arduino-language-server',

        -- bash
        'bash-language-server',
        'shfmt',
        'shellcheck',

        --c/c++
        'codelldb',

        -- cmake
        'cmake-language-server',
        'cmakelang',
        'cmakelint',

        --java
        -- 'java-language-server',

        --js/ts
        'typescript-language-server',
        'tailwindcss-language-server',
        'prettierd',
        -- 'firefox-debug-adapter',

        -- lua
        'lua-language-server',
        'stylua',
        'selene',

        -- nix
        'rnix-lsp',

        -- openscad
        'openscad-lsp',

        -- python
        'python-lsp-server',
        'flake8',
        'yapf',
        'isort',
        'vulture',

        --vue
        'vue-language-server',

        --tools
        'tree-sitter-cli',
      },
      start_delay = 1000, -- 3 second delay
    },
  },
}
