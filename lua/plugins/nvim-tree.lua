return {
  'nvim-tree/nvim-tree.lua',
  dependancies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'open nvim tree' },
  },
  opts = {
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  },
}
