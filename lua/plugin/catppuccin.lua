return {
  name = 'catppuccin-nvim',
  src = 'https://github.com/catppuccin/nvim',
  data = {
    after = function()
      vim.cmd.colorscheme('catppuccin')
    end,
    lazy = false,
    dep_of = "lualine.nvim"
  },
}
