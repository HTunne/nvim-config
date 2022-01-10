return {
  name = '+telescope',
  p = { require('telescope.builtin').git_files, 'find files in git repo' },
  f = { require('telescope.builtin').find_files, 'find files' },
  h = { require('telescope.builtin').help_tags, 'find files' },
  g = {
    function()
      require('telescope.builtin').grep_string({ search = vim.fn.input('Grep for > ') })
    end,
    'grep over files',
  },
  w = { require('telescope.builtin').grep_string, 'find current word' },
}
