local actions = require('telescope.actions')
require('telescope').setup({
  defualts = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,

    mappins = {
      i = {
        ['<C-q>'] = actions.send_to_qflist,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

require('telescope').load_extension('fzy_native')
