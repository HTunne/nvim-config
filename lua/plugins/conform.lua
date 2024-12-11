return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  ft = { 'bash', 'javascript', 'lua', 'python', 'sh', 'typescript' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      bash = { 'shfmt' },
      javascript = { 'eslint', { 'prettierd', 'prettier' } },
      lua = { 'stylua' },
      nix = { 'alejandra' },
      python = { 'isort', 'yapf' },
      qml = { 'qmlformat' },
      typescript = { 'eslint', { 'prettierd', 'prettier' } },
      sh = { 'shfmt' },
    },
    formatters = {
      qmlformat = {
        command = 'qmlformat',
        args = { '--inplace', '$FILENAME' },
        stdin = false,
      },
      shfmt = {
        prepend_args = { '-i', '2' },
      },
      yapf = {
        env = { COLUMN_LIMIT = 80 },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
