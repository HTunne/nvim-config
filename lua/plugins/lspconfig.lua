return {
  {
    'neovim/nvim-lspconfig',
    ft = { 'rust', 'c', 'cpp', 'tex', 'typescript', 'java', 'python', 'lua' },
    config = function()
      local lspconfig = require('lspconfig')

      local servers = { 'rust_analyzer', 'ccls', 'texlab', 'tsserver' }
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

      lspconfig.sumneko_lua.setup({
        cmd = { 'lua-language-server', '-E' },
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
              -- Setup your lua path
              path = vim.split(package.path, ';'),
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
              },
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
