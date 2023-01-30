return {
  'nvim-telescope/telescope-dap.nvim',
  dependancies = {
    'mfussenegger/nvim-dap',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    {
      '<leader>pdc',
      function()
        require('telescope').extensions.dap.commands({})
      end,
      desc = 'dap commands',
    },
    {
      '<leader>pdg',
      function()
        require('telescope').extensions.dap.configurations({})
      end,
      desc = 'dap configurations',
    },
    {
      '<leader>pdb',
      function()
        require('telescope').extensions.dap.list_breakpoints({})
      end,
      desc = 'dap breakpoints',
    },
    {
      '<leader>pdv',
      function()
        require('telescope').extensions.dap.variables({})
      end,
      desc = 'dap variables',
    },
    {
      '<leader>pdf',
      function()
        require('telescope').extensions.dap.frames({})
      end,
      desc = 'dap frames',
    },
  },
  config = function()
    require('telescope').load_extension('dap')
  end,
}
