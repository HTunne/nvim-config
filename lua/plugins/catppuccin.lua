return {
  'catppuccin/nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd.colorscheme('catppuccin')
  end,
  opts = {
    integrations = {
      aerial = true,
      barbar = true,
      cmp = true,
      dap = true,
      gitsigns = true,
      hop = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
      },
      nvimtree = true,
      telescope = true,
      treesitter = true,
      lsp_trouble = true,
      vimwiki = true,
      which_key = true,
    },
  },
}
