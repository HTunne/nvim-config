-- stylua: ignore
-- stylua ignore to preserve semi-colons
require('paq')({
  'savq/paq-nvim'; -- paq-nvim manages itself

  -- Aesthetic
  'monsonjeremy/onedark.nvim';
  'hoob3rt/lualine.nvim'; -- 'kyazdani42/nvim-web-devicons'
  'romgrk/barbar.nvim'; -- 'kyazdani42/nvim-web-devicons'
  'norcalli/nvim-colorizer.lua';
  'kyazdani42/nvim-web-devicons';
  'lukas-reineke/indent-blankline.nvim';
  'folke/zen-mode.nvim';
  'folke/twilight.nvim';
  'folke/trouble.nvim'; -- 'kyazdani42/nvim-web-devicons'
  'chentoast/marks.nvim';

  -- lsp
  'neovim/nvim-lspconfig'; -- rust_analyzer, vuels, ccls, texlab, tsserver, null-ls, java_language_server, pyright, sumneko_lua
  'jose-elias-alvarez/null-ls.nvim'; -- sytlua, black, prettier, ccpcheck, qmllint, qmlformat

  -- Treesitter
  'nvim-treesitter/nvim-treesitter';
  'nvim-treesitter/nvim-treesitter-context';
  'nvim-treesitter/playground'; --'nvim-treesitter/nvim-treesitter'
  'lewis6991/spellsitter.nvim'; --'nvim-treesitter/nvim-treesitter'
  'code-biscuits/nvim-biscuits'; -- 'nvim-treesitter/nvim-treesitter'

  -- Completion
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-nvim-lua';
  'hrsh7th/cmp-calc';
  'doxnit/cmp-luasnip-choice';
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
  'axkirillov/easypick.nvim';
  -- 'AckslD/nvim-neoclip.lua';

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
  'akinsho/git-conflict.nvim';
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

  -- 'vhyrro/neorg';
})
