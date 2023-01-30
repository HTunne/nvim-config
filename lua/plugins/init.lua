------------------------------------------------------------------------
--                              plugin                                --
------------------------------------------------------------------------
return {
  'milisims/nvim-luaref',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'lukas-reineke/indent-blankline.nvim',
  { 'norcalli/nvim-colorizer.lua', config = true },
  { 'akinsho/git-conflict.nvim', config = true, cond = require('util').is_git_repo },
  { 'numToStr/Comment.nvim', config = true, keys = { { 'gc', mode = { 'n', 'v' } }, { 'gb', mode = { 'n', 'v' } } } },
}
