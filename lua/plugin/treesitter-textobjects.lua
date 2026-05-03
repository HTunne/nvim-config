return {
  src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  version = 'main',
  data = {
    dep_of = {
      'mini.nvim',
    },
    after = function()
      vim.keymap.set('n', '<leader>a', function()
        require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')
      end, { desc = 'Swap parameter next' })
      vim.keymap.set('n', '<leader>A', function()
        require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.outer')
      end, { desc = 'Swap parameter previous' })
    end,
  },
}
