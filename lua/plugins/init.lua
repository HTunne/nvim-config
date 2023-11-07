------------------------------------------------------------------------
--                              plugin                                --
------------------------------------------------------------------------
return {
  { 'folke/neodev.nvim', opts = {} },
  'milisims/nvim-luaref',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'neomake/neomake',
  'lukas-reineke/indent-blankline.nvim',
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  { 'norcalli/nvim-colorizer.lua', config = true },
  { 'akinsho/git-conflict.nvim', config = true, cond = require('util').is_git_repo },
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
