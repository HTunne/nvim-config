return {
  src = 'https://github.com/obsidian-nvim/obsidian.nvim',
  data = {
    lazy = false,
    after = function()
      require('obsidian').setup({
        legacy_commands = false,
        note_id_func = require('obsidian.builtin').title_id,
        picker = {
          name = 'fzf-lua',
        },
        workspaces = {
          { name = 'notes', path = '~/notes' },
        },
      })
    end,
  },
}
