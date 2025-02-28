return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  opts = {},
  ft = 'markdown',
  keys = {
    { '<leader>no', '<CMD>ObsidianOpen<CR>', desc = 'Open in obsidian app' },
    { '<leader>nn', '<CMD>ObsidianNew<CR>', desc = 'Create new note' },
    { '<leader>nb', '<CMD>ObsidianBacklinks<CR>', desc = 'Select note from backticks' },
    { '<leader>ng', '<CMD>ObsidianTags<CR>', desc = 'Select note by tag' },
    { '<leader>ns', '<CMD>ObsidianTags<CR>', desc = 'Search in notes' },
    { '<leader>nq', '<CMD>ObsidianQuickSwitch<CR>', desc = 'Switch note' },
    { '<leader>nt', '<CMD>ObsidianToday<CR>', desc = 'Open todays note' },
    { '<leader>ny', '<CMD>ObsidianYesterday<CR>', desc = 'Open yesterdays note' },
    { '<leader>nw', '<CMD>ObsidianTomorrow<CR>', desc = 'Open tomorrows note' },
    { '<leader>np', '<CMD>ObsidianPasteImg<CR>', desc = 'Paste image' },
    { '<leader>nr', '<CMD>ObsidianRename<CR>', desc = 'Rename file' },
    {
      '<leader>nm',
      function()
        local _, project = require('util').get_project_dir():match('(.*/)(.*)')
        local client = require('obsidian').get_client()
        client:command('ObsidianNew', { args = project .. '.md' })
      end,
      desc = 'Open tomorrows note',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'pk',
        path = '~/notes',
      },
    },
  },
}
