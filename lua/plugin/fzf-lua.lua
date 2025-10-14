return {
  src = 'https://github.com/ibhagwan/fzf-lua',
  data = {
    after = function()
      vim.keymap.set('n', '<leader>ff', function()
        require('fzf-lua').git_files()
      end, { desc = 'find git file' })
      vim.keymap.set('n', '<leader>fa', function()
        require('fzf-lua').files()
      end, { desc = 'find any file' })
      vim.keymap.set('n', '<leader>fh', function()
        require('fzf-lua').helptags()
      end, { desc = 'find help tag' })
      vim.keymap.set('n', '<leader>fg', function()
        require('fzf-lua').grep()
      end, { desc = 'find grep' })
      vim.keymap.set('n', '<leader>fw', function()
        require('fzf-lua').grep_cword()
      end, { desc = 'find current word' })
    end,
  },
}
