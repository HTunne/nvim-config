------------------------------------------------------------------------
--                              plugin                                --
------------------------------------------------------------------------

return {
  { 'folke/neodev.nvim', opts = {} },
  'milisims/nvim-luaref',
  { 'kylechui/nvim-surround', event = 'VeryLazy', opts = {} },
  'tpope/vim-repeat',
  'LunarVim/bigfile.nvim',
  'tpope/vim-sleuth',
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  { 'norcalli/nvim-colorizer.lua', main = 'colorizer', config = true },
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
  { 'htunne/neorg-taskwarrior', dev = true },
}
