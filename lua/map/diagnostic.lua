return {
  name = '+diagnostic',
  ['[d'] = { vim.diagnostic.goto_prev, 'go to previous diagnostic' },
  [']d'] = { vim.diagnostic.goto_next, 'go to next diagnostic' },
  ['<leader>'] = {
    name = '+diagnostic',
    i = {
      e = { vim.diagnostic.open_float, 'show diagnostic' },
      q = { vim.diagnostic.set_loclist, 'set location list' },
    },
  },
}
