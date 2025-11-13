return {
  name = 'catppuccin',
  src = 'https://github.com/catppuccin/nvim',
  data = {
    colorscheme = 'catppuccin',
    after = function()
      vim.cmd.colorscheme('catppuccin')
    end,
    lazy = false,
  },
}
