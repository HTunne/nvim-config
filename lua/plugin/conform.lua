return {
  src = 'https://github.com/stevearc/conform.nvim',
  -- ft = { 'bash', 'javascript', 'lua', 'python', 'sh', 'typescript' },
  data = {
    after = function()
      require('conform').setup({
        formatters_by_ft = {
          bash = { 'shfmt' },
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          lua = { 'stylua' },
          nix = { 'alejandra' },
          python = { 'isort', 'yapf' },
          qml = { 'qmlformat',  'pyside6_qmlformat', stop_after_first = true },
          typescript = { 'prettierd', 'prettier', stop_after_first = true },
          sh = { 'shfmt' },
        },
        formatters = {
          pyside6_qmlformat = {
            command = 'pyside6-qmlformat',
            args = { '--inplace', '$FILENAME' },
            stdin = false,
          },
          yapf = {
            env = { COLUMN_LIMIT = 80 },
          },
        },
      })

      vim.keymap.set('n', '<leader>p', function()
        require('conform').format({ async = true, lsp_fallback = true })
      end, { desc = 'Format buffer' })
    end,
    before = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
