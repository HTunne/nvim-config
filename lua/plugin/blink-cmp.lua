return {
  src = 'https://github.com/Saghen/blink.cmp',
  version = '1.6',
  data = {
    after = function()
      require('blink.cmp').setup({
        snippets = { preset = 'luasnip' },
      })
    end,
  },
}
