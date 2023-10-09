return {
  {
    'neovim/nvim-lspconfig',
    ft = { 'rust', 'c', 'cpp', 'tex', 'typescript', 'java', 'python', 'lua' },
    config = function()
      local lspconfig = require('lspconfig')

      local servers = { 'rust_analyzer', 'clangd', 'texlab', 'tsserver' }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
      end

      lspconfig.java_language_server.setup({
        cmd = { 'java-language-server' },
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      lspconfig.pyright.setup({
        root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()),
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
              checkThirdParty = false
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
