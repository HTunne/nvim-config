return {
  src = 'https://github.com/Wansmer/treesj',
  data = {
    after = function()
      vim.keymap.set('n', '<leader>m', function()
        require('treesj').toggle()
      end, { desc = 'split/join' })
    end,
  },
}
