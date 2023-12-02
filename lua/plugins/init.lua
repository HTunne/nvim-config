------------------------------------------------------------------------
--                              plugin                                --
------------------------------------------------------------------------

return {
  { 'folke/neodev.nvim', opts = {} },
  'milisims/nvim-luaref',
  'kylechui/nvim-surround',
  'tpope/vim-repeat',
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  { 'norcalli/nvim-colorizer.lua', main = "colorizer", config = true },
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
  {
    'peterhoeg/vim-qml',
    event = 'BufRead',
    ft = { 'qml' },
  },

  { 'htunne/neorg-taskwarrior', dev = true },
}
