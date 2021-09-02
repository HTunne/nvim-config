-----------
--  paq  --
-----------

-- Bootsrap paq
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
local install_required = false

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
  install_required = true
end

require('paq')({
  'savq/paq-nvim';    -- paq-nvim manages itself
  -- Aesthetic
  'HTunne/vim-one';
  'hoob3rt/lualine.nvim';
  'romgrk/barbar.nvim';
  {'RRethy/vim-hexokinase', run='make hexokinase'};
  'kyazdani42/nvim-web-devicons';
  'folke/zen-mode.nvim';
  -- lsp
  'neovim/nvim-lspconfig';
  -- Treesitter
  'nvim-treesitter/nvim-treesitter';
  'nvim-treesitter/playground';
  -- Completion
  --paq {'nvim-lua/completion-nvim'}
  --paq {'ervandew/supertab'}
  --paq {'nvim-treesitter/completion-treesitter'}
  'hrsh7th/nvim-compe'; -- Switch when regex transform is supported
  'hrsh7th/vim-vsnip';
  'hrsh7th/vim-vsnip-integ';
  -- Telescope
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  'nvim-telescope/telescope-fzy-native.nvim';
  -- Snippets
  'sirver/ultisnips';
  'htunne/vim-snippets';
  -- VimWiki
  'vimwiki/vimwiki';
  'tools-life/taskwiki';
  --  Convenience
  'kyazdani42/nvim-tree.lua';
  'folke/which-key.nvim';
  'phaazon/hop.nvim';
  'lewis6991/gitsigns.nvim';
  'tpope/vim-commentary';
  'tpope/vim-surround';
  'tpope/vim-repeat';
  -- DAP
  'mfussenegger/nvim-dap';
  'rcarriga/nvim-dap-ui';
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
--require('plugin.complete-config')
require('plugin.nvim-compe-config')
require('plugin.vimwiki-config')
require('plugin.telescope-config')
require('plugin.neorg-config')
require('lualine').setup({ options = { theme = 'onedark', section_separators = '', component_separators = '' }})
require('gitsigns').setup()
require('which-key').setup({ plugins = { spelling = { enabled=true }}})
require('hop').setup()
