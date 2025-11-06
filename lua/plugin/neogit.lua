return {
  src = 'https://github.com/NeogitOrg/neogit',
  data = {
    after = function()
      require('neogit').setup()
    end,
    keys = {
      {
        lhs = '<leader>g',
        rhs = function()
          require('neogit').open()
        end,
        mode = { 'n' },
        desc = 'Open parent directory',
      },
    },
  },
}
