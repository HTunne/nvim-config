return {
  'folke/trouble.nvim',
  config = true,
  keys = {
    {
      '<leader>tt',
      function()
        require('trouble').toggle()
      end,
      desc = 'trouble toggle',
    },
    {
      '<leader>tq',
      function()
        require('trouble').toggle('quickfix')
      end,
      desc = 'trouble toggle',
    },
    {
      '<leader>tr',
      function()
        require('trouble').refresh()
      end,
      desc = 'trouble refresh',
    },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
