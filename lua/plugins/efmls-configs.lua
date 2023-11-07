return {
  'creativenull/efmls-configs-nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  ft = { 'bash', 'cmake', 'lua', 'typescript', 'python' },
  config = function()
    local languages = {
      bash = {
        require('efmls-configs.formatters.shfmt'),
        require('efmls-configs.linters.shellcheck'),
      },
      cmake = {
        require('efmls-configs.linters.cmake_lint'),
      },
      javascript = {
        require('efmls-configs.formatters.eslint'),
        require('efmls-configs.formatters.prettier_d'),
      },
      lua = {
        require('efmls-configs.formatters.stylua'),
        require('efmls-configs.linters.luacheck'),
      },
      typescript = {
        require('efmls-configs.formatters.eslint'),
        require('efmls-configs.formatters.prettier_d'),
      },
      python = {
        require('efmls-configs.formatters.black'),
        require('efmls-configs.formatters.isort'),
      },
    }

    require('lspconfig').efm.setup({
      filetypes = vim.tbl_keys(languages),
      settings = {
        rootMarkers = { '.git/' },
        languages = languages,
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      },
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  end,
}
