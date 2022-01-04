------------------------------------------------------------------------
--                                paq                                 --
------------------------------------------------------------------------

-- Bootsrap paq
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
local install_required = false

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    '--depth=1',
    'https://github.com/savq/paq-nvim.git',
    install_path
  })
  install_required = true
end

require('paq')({
  'savq/paq-nvim';    -- paq-nvim manages itself

  -- Aesthetic
  'monsonjeremy/onedark.nvim';
  'hoob3rt/lualine.nvim';
  'romgrk/barbar.nvim';
  'norcalli/nvim-colorizer.lua';
  'kyazdani42/nvim-web-devicons';
  'folke/zen-mode.nvim';

  -- lsp
  'neovim/nvim-lspconfig';

  -- Treesitter
  'nvim-treesitter/nvim-treesitter';
  'nvim-treesitter/playground';

  -- Completion
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-nvim-lua';
  'hrsh7th/cmp-calc';
  'ray-x/cmp-treesitter';
  'saadparwaiz1/cmp_luasnip';
  -- 'quangnguyen30192/cmp-nvim-ultisnips';
  'f3fora/cmp-spell';
  'onsails/lspkind-nvim';
  'hrsh7th/nvim-cmp';

  -- Telescope
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  'nvim-telescope/telescope-fzy-native.nvim';

  -- Snippets
  'L3MON4D3/LuaSnip';
  'rafamadriz/friendly-snippets';
  -- 'sirver/ultisnips';
  -- 'htunne/vim-snippets';

  -- VimWiki
  'vimwiki/vimwiki';
  'tools-life/taskwiki';

  --  Convenience
  'kyazdani42/nvim-tree.lua';
  'folke/which-key.nvim';
  'phaazon/hop.nvim';
  'lewis6991/gitsigns.nvim';
  'numToStr/Comment.nvim';
  'tpope/vim-surround';
  'tpope/vim-repeat';

  -- DAP
  'mfussenegger/nvim-dap';
  'rcarriga/nvim-dap-ui';
  'theHamsta/nvim-dap-virtual-text';
  'nvim-telescope/telescope-dap.nvim';
  'mfussenegger/nvim-dap-python';
  'jbyuki/one-small-step-for-vimkind';

  'jupyter-vim/jupyter-vim';

  'vhyrro/neorg';
})

if install_required then
  vim.api.nvim_command('PaqInstall')
end

-- plugin config
require('plugin.treesitter-config')
require('plugin.nvim-tree-config')
require('plugin.nvim-cmp-config')
require('plugin.luasnip-config')
require('plugin.vimwiki-config')
require('plugin.telescope-config')
require('plugin.neorg-config')
require('onedark').setup({
})
require('lualine').setup({
  options = {
    theme = 'onedark',
    section_separators = '',
    component_separators = ''
  }
})
require('colorizer').setup()
require('gitsigns').setup()
require('Comment').setup()
require('which-key').setup({ plugins = { spelling = { enabled=true }}})
require('hop').setup()
-- vim.g.UltiSnipsRemoveSelectModeMappings = 0
require('nvim-dap-virtual-text').setup()
