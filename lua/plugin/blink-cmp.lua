return {
  src = 'https://github.com/Saghen/blink.cmp',
  version = 'v1.8.0',
  data = {
    after = function()
      require('blink.cmp').setup({
        snippets = { preset = 'luasnip' },
        sources = {
          per_filetype = {
            markdown = {
              'lsp',
            },
          },
        },
      })
    end,
  },
}
