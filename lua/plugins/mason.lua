return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    opts = {
      ensure_installed = {
        -- bash
        'bash-language-server',
        'shfmt',
        'shellcheck',

        --c/c++
        'codelldb',

        -- cmake
        'cmake-language-server',
        'cmakelang',

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

        --vue
        'vue-language-server',

        --tools
        'tree-sitter-cli',
      },
      start_delay = 1000, -- 3 second delay
    },
  },
}
