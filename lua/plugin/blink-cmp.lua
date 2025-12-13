return {
  src = 'https://github.com/Saghen/blink.cmp',
  version = 'v1.8.0',
  data = {
    after = function()
      require('blink.cmp').setup({
        snippets = { preset = 'luasnip' },
      })
    end,
  },
}
