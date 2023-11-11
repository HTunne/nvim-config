return {
  'lewis6991/gitsigns.nvim',
  cond = require('util').is_git_repo,
  keys = {
    -- Navigation
    {
      ']c',
      function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          require('gitsigns').next_hunk()
        end)
        return '<Ignore>'
      end,
      expr = true,
    },
    {
      '[c',
      function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          require('gitsigns').prev_hunk()
        end)
        return '<Ignore>'
      end,
      expr = true,
    },

    -- Actions
    { '<leader>hs', require('gitsigns').stage_hunk, mode = { 'n', 'v' }, desc = 'stage hunk' },
    { '<leader>hr', require('gitsigns').reset_hunk, mode = { 'n', 'v' }, desc = 'reset hunk' },
    { '<leader>hS', require('gitsigns').stage_buffer, desc = 'stage buffer' },
    { '<leader>hu', require('gitsigns').undo_stage_hunk, desc = 'undo stage hunk' },
    { '<leader>hR', require('gitsigns').reset_buffer, desc = 'reset buffer' },
    { '<leader>hp', require('gitsigns').preview_hunk, desc = 'preview hunk' },
    {
      '<leader>hb',
      function()
        require('gitsigns').blame_line({ full = true })
      end,
      desc = 'blame line',
    },
    { '<leader>htb', require('gitsigns').toggle_current_line_blame, desc = 'toggle blame line' },
    { '<leader>hd', require('gitsigns').diffthis, desc = 'diff hunk' },
    {
      '<leader>hD',
      function()
        require('gitsigns').diffthis('~')
      end,
      desc = 'diff file',
    },
    { '<leader>htd', require('gitsigns').toggle_deleted, desc = 'toggle deleted' },

    -- Text object
    { 'ih', ':<C-U>Gitsigns select_hunk<CR>', mode = { 'o', 'x' }, desc = 'select hunk' },
  },
  opts = {},
}
