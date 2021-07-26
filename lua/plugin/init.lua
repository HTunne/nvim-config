-----------
--  paq  --
-----------

require "paq" {
  'savq/paq-nvim';    -- paq-nvim manages itself
  -- Aesthetic
  'HTunne/vim-one';
  'itchyny/lightline.vim';
  {'RRethy/vim-hexokinase', run='make hexokinase'};
  'kyazdani42/nvim-web-devicons';
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
  'easymotion/vim-easymotion';
  'lewis6991/gitsigns.nvim';
  'tpope/vim-commentary';
  'tpope/vim-surround';
  'tpope/vim-repeat';
  -- DAP
  'mfussenegger/nvim-dap';
  'nvim-telescope/telescope-dap.nvim';
  'mfussenegger/nvim-dap-python';
  'jbyuki/one-small-step-for-vimkind';

  'jupyter-vim/jupyter-vim';

  'vhyrro/neorg';
}

-- plugin config
require('plugin.treesitter-config')
require('plugin.nvim-tree-config')
--require('plugin.complete-config')
require('plugin.nvim-compe-config')
require('plugin.vimwiki-config')
require('plugin.telescope-config')
require('plugin.neorg-config')
require('gitsigns').setup()
