return {
  src = 'https://github.com/lewis6991/gitsigns.nvim',
  data = {
    after = function()
      require('gitsigns').setup()

      -- Navigation
      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          require('gitsigns').next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true })

      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          require('gitsigns').prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true })

      -- Actions
      vim.keymap.set({ 'n', 'v' }, '<leader>hs', require('gitsigns').stage_hunk, { desc = 'stage hunk' })
      vim.keymap.set({ 'n', 'v' }, '<leader>hr', require('gitsigns').reset_hunk, { desc = 'reset hunk' })
      vim.keymap.set('n', '<leader>hS', require('gitsigns').stage_buffer, { desc = 'stage buffer' })
      vim.keymap.set('n', '<leader>hu', require('gitsigns').undo_stage_hunk, { desc = 'undo stage hunk' })
      vim.keymap.set('n', '<leader>hR', require('gitsigns').reset_buffer, { desc = 'reset buffer' })
      vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { desc = 'preview hunk' })
      vim.keymap.set('n', '<leader>hb', function()
        require('gitsigns').blame_line({ full = true })
      end, { desc = 'blame line' })
      vim.keymap.set('n', '<leader>htb', require('gitsigns').toggle_current_line_blame, { desc = 'toggle blame line' })
      vim.keymap.set('n', '<leader>hd', require('gitsigns').diffthis, { desc = 'diff hunk' })
      vim.keymap.set('n', '<leader>hD', function()
        require('gitsigns').diffthis('~')
      end, { desc = 'diff file' })
      vim.keymap.set('n', '<leader>htd', require('gitsigns').toggle_deleted, { desc = 'toggle deleted' })

      -- Text object
      vim.keymap.set({ 'o', 'x' }, 'ih', ':<c-U>Gitsigns select_hunk<cr>', { desc = 'select hunk' })
    end,
  },
}
