return {
  'creativenull/efmls-configs-nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  ft = { 'bash', 'c', 'cmake', 'cpp', 'lua', 'typescript', 'python' },
  config = function()
    local languages = {
      bash = {
        require('efmls-configs.formatters.shfmt'),
        require('efmls-configs.linters.shellcheck'),
      },
      c = {
        require('efmls-configs.formatters.clang_format'),
        require('efmls-configs.formatters.clang_tidy'),
        require('efmls-configs.linters.clang_tidy'),
      },
      cmake = {
        require('efmls-configs.linters.cmake_lint'),
      },
      cpp = {
        require('efmls-configs.formatters.clang_format'),
        require('efmls-configs.formatters.clang_tidy'),
        require('efmls-configs.linters.clang_tidy'),
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
