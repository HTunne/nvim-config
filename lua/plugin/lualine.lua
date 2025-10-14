return {
  src = 'https://github.com/hoob3rt/lualine.nvim',
  data = {
    after = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin',
          section_separators = '',
          component_separators = '',
        },
      })
    end,
  },
}
