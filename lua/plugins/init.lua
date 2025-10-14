------------------------------------------------------------------------
--                              plugin                                --
------------------------------------------------------------------------

return {
  { 'folke/neodev.nvim', opts = {} },
  'milisims/nvim-luaref',
  { 'kylechui/nvim-surround', event = 'VeryLazy', opts = {} },
  'tpope/vim-repeat',
  {
    'tpope/vim-sleuth',
    event = 'VeryLazy',
    keys = {
      { '<leader>s', '<cmd>Sleuth<CR>', desc = 'run sleuth' },
    },
  },
  {
    'kjuq/sixelview.nvim',
    opts = {},
  },
  -- { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    'hat0uma/csvview.nvim',
    opts = {},
    keys = { '<leader>uv', '<cmd>CsvViewToggle', desc = 'toggle csvview' },
  },
  {
    'akinsho/git-conflict.nvim',
    config = true,
    cond = require('util').is_git_repo,
  },
  {
    'numToStr/Comment.nvim',
    config = true,
    keys = { { 'gc', mode = { 'n', 'v' } }, { 'gb', mode = { 'n', 'v' } } },
  },
  'stevearc/vim-arduino',
  -- { 'htunne/neorg-taskwarrior', dev = true },
}
