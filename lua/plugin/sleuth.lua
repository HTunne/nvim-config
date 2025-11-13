return {
  src = 'https://github.com/tpope/vim-sleuth',
  data = {
    after = function()
      vim.keymap.set('n', '<leader>s', '<cmd>Sleuth<CR>', { desc = 'run sleuth' })
    end,
  },
}
