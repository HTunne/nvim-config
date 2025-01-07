return {
  {
    'neovim/nvim-lspconfig',
    ft = {
      'bash',
      'c',
      'cmake',
      'cpp',
      'java',
      'javascript',
      'lua',
      'openscad',
      'python',
      'qml',
      'rust',
      'sh',
      'typescript',
      'vue',
      'zig',
    },
    dependencies = {
      'p00f/clangd_extensions.nvim',
      'saghen/blink.cmp',
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
              },
              format = {
                enable = false,
              },
              diagnostics = {
                globals = { 'vim' },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        bashls = {},
        cmake = {},
        clangd = {
          on_attach = function()
            require('clangd_extensions.inlay_hints').setup_autocmd()
            require('clangd_extensions.inlay_hints').set_inlay_hints()
            vim.keymap.set('n', '<leader>ls', '<cmd>ClangdSwitchSourceHeader<cr>', { desc = 'switch source/header' })
            vim.keymap.set('n', '<leader>lt', '<cmd>ClangdTypeHierarchy<cr>', { desc = 'show type heirachy' })
          end,
        },
        qmlls = {},
        java_language_server = {
          cmd = { 'java-language-server' },
        },
        rust_analyzer = {},
        tailwindcss = {},
        ts_ls = {},
        volar = {
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
        },
        zls = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
      vim.api.nvim_exec_autocmds('User', { pattern = 'LspConfigLoaded' })
    end,
  },
  { 'ray-x/lsp_signature.nvim', opts = {}, event = 'VeryLazy' },
  { 'j-hui/fidget.nvim', config = true, event = 'LspAttach' },
}
