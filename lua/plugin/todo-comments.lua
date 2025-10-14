return {
  src = 'https://github.com/folke/todo-comments.nvim',
  data = {
    after = function()
      require('todo-comments').setup()
      vim.keymap.set('n', ']t', function()
        require('todo-comments').jump_next()
      end, { desc = 'Next todo comment' })

      vim.keymap.set('n', '[t', function()
        require('todo-comments').jump_prev()
      end, { desc = 'Previous todo comment' })

      vim.keymap.set('n', '[t', function()
        require('todo-comments').jump_prev()
      end, { desc = 'Previous todo comment' })

      vim.keymap.set('n', '<leader>ft', '<cmd>TodoFzfLua<cr>', { desc = 'find todo comments' })
    end,
  },
}
