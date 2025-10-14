return {
  'obsidian-nvim/obsidian.nvim',
  -- version = '*',
  lazy = true,
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
      desc = 'Open note for this project',
    },
  },
  cmd = {
    'ObsidianBacklinks',
    'ObsidianCheck',
    'ObsidianDailies',
    'ObsidianDebug',
    'ObsidianExtractNote',
    'ObsidianFollowLink',
    'ObsidianLink',
    'ObsidianLinkNew',
    'ObsidianLinks',
    'ObsidianNew',
    'ObsidianNewFromTemplate',
    'ObsidianOpen',
    'ObsidianPasteImg',
    'ObsidianQuickSwitch',
    'ObsidianRename',
    'ObsidianSearch',
    'ObsidianTOC',
    'ObsidianTags',
    'ObsidianTemplate',
    'ObsidianToday',
    'ObsidianToggleCheckbox',
    'ObsidianTomorrow',
    'ObsidianWorkspace',
    'ObsidianYesterday',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'saghen/blink.cmp',
  },
  opts = {
    workspaces = {
      {
        name = 'home',
        path = vim.fn.expand("~") .. '/notes',
      },
    },
  },
  completion = {
    nvim_cmp = false,
    blink = true,
    min_chars = 0,
  },
}
