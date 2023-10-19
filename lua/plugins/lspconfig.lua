return {
  {
    'neovim/nvim-lspconfig',
    ft = { 'rust', 'c', 'cpp', 'tex', 'typescript', 'java', 'python', 'lua', 'openscad' },
    dependencies = {
      'p00f/clangd_extensions.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local lspconfig = require('lspconfig')

      local servers = { 'rust_analyzer', 'texlab', 'tsserver' }
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
          vim.keymap.set('n', '<leader>ls', ':ClangdSwitchSourceHeader<CR>', { desc = 'switch source/header' })
          vim.keymap.set('n', '<leader>lt', ':ClangdTypeHierarchy<CR>', { desc = 'show type heirachy' })
        end,
      })

      lspconfig.java_language_server.setup({
        cmd = { 'java-language-server' },
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      lspconfig.pyright.setup({
        root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()),
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      lspconfig.openscad_lsp.setup({
        cmd = { 'openscad-lsp', '--stdio', '--fmt-style', 'LLVM' },
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      vim.api.nvim_exec_autocmds('User', { pattern = 'LspConfigLoaded' })
    end,
  },
  { 'j-hui/fidget.nvim', config = true, event = 'User NvimDapLoaded' },
}
