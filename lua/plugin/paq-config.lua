-- stylua: ignore
-- stylua ignore to preserve semi-colons
require('paq')({
  'savq/paq-nvim'; -- paq-nvim manages itself

  -- Aesthetic
  'monsonjeremy/onedark.nvim';
  'hoob3rt/lualine.nvim';
  'romgrk/barbar.nvim';
  'norcalli/nvim-colorizer.lua';
  'kyazdani42/nvim-web-devicons';
  'folke/zen-mode.nvim';
  'folke/trouble.nvim';

  -- lsp
  'neovim/nvim-lspconfig';
  'jose-elias-alvarez/null-ls.nvim';

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

  -- VimWiki
  'vimwiki/vimwiki';
  'tools-life/taskwiki';

  --  Convenience
  'kyazdani42/nvim-tree.lua';
  'stevearc/aerial.nvim';
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
