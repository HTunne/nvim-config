return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    {
      '<leader>pz',
      function()
        require('telescope.builtin').find_files({ cwd = require('lazy.core.config').options.root })
      end,
      desc = 'Find Plugin File'
    },
    { '<leader>pp', function() require('telescope.builtin').git_files() end, desc = 'find files in git repo' },
    { '<leader>pf', function() require('telescope.builtin').find_files() end, desc = 'find files' },
    { '<leader>ph', function() require('telescope.builtin').help_tags() end, desc = 'find files' },
    {
      '<leader>pg',
      function()
        require('telescope.builtin').grep_string({ search = vim.fn.input('Grep for > ') })
      end,
      desc = 'grep over files',
    },
    { '<leader>pw', function() require('telescope.builtin').grep_string() end, desc = 'find current word' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defualts = {
        mappins = {
          i = {
            ['<C-q>'] = actions.send_to_qflist,
          },
        },
      },
    })
    telescope.load_extension('fzf')
  end,
}
