return {
  src = 'https://github.com/NeogitOrg/neogit',
  data = {
    after = function()
      require('neogit').setup()
    end,
    keys = {
      {
        '<leader>g',
        function()
          require('neogit').open()
        end,
        mode = { 'n' },
        desc = 'Open parent directory',
      },
    },
  },
}
