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
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    keys = { '<leader>uz', '<cmd>ColorizerToggle<CR>', desc = 'toggle colorizer' },
  },
  {
    'hat0uma/csvview.nvim',
    opts={},
    keys = { '<leader>uv','<cmd>CsvViewToggle', desc = 'toggle csvview' },
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
