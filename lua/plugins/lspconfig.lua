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
      'rust',
      'sh',
      'typescript',
      'vue',
    },
    dependencies = {
      'p00f/clangd_extensions.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local lspconfig = require('lspconfig')

      local servers = { 'bashls', 'cmake', 'rnix', 'rust_analyzer', 'tailwindcss', 'tsserver', 'volar' }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
      end

      lspconfig.clangd.setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = function()
          require('clangd_extensions.inlay_hints').setup_autocmd()
          require('clangd_extensions.inlay_hints').set_inlay_hints()
          vim.keymap.set('n', '<leader>ls', '<cmd>ClangdSwitchSourceHeader<cr>', { desc = 'switch source/header' })
          vim.keymap.set('n', '<leader>lt', '<cmd>ClangdTypeHierarchy<cr>', { desc = 'show type heirachy' })
        end,
      })

      lspconfig.java_language_server.setup({
        cmd = { 'java-language-server' },
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      lspconfig.lua_ls.setup({
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
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      lspconfig.openscad_lsp.setup({
        cmd = { 'openscad-lsp', '--stdio', '--fmt-style', 'LLVM' },
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      lspconfig.pylsp.setup({
        root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()),
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      vim.api.nvim_exec_autocmds('User', { pattern = 'LspConfigLoaded' })
    end,
  },
  { 'ray-x/lsp_signature.nvim', opts = {}, event = 'VeryLazy' },
  { 'j-hui/fidget.nvim', config = true, event = 'User NvimDapLoaded' },
}
