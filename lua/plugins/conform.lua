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
      python = { 'isort', 'yapf' },
      typescript = { 'eslint', { 'prettierd', 'prettier' } },
      sh = { 'shfmt' },
    },
    formatters = {
      shfmt = {
        prepend_args = { '-i', '2' },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
