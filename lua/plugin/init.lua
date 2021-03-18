-----------
--  paq  --
-----------

vim.cmd 'packadd paq-nvim'           -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
-- Aesthetic
paq {'HTunne/vim-one'}
paq {'itchyny/lightline.vim'}
paq {'RRethy/vim-hexokinase', run='make hexokinase'}
paq {'kyazdani42/nvim-web-devicons'}
-- lsp
paq {'neovim/nvim-lspconfig'}
-- Treesitter
paq {'nvim-treesitter/nvim-treesitter'}
-- Completion
paq {'nvim-lua/completion-nvim'}
paq {'ervandew/supertab'}
paq {'nvim-treesitter/completion-treesitter'}
--paq {'hrsh7th/nvim-compe'} -- Switch when regex transform is supported
--paq {'hrsh7th/vim-vsnip'}
--paq {'hrsh7th/vim-vsnip-integ'}
-- Telescope
paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'nvim-telescope/telescope-fzy-native.nvim'}
-- Snippets
paq {'sirver/ultisnips'}
paq {'htunne/vim-snippets'}
-- VimWiki
paq {'vimwiki/vimwiki'}
paq {'tools-life/taskwiki'}
--  Convenience
paq {'kyazdani42/nvim-tree.lua'}
paq {'liuchengxu/vim-which-key'}
paq {'easymotion/vim-easymotion'}
paq {'tpope/vim-commentary'}
paq {'tpope/vim-surround'}
paq {'tpope/vim-repeat'}

paq {'jupyter-vim/jupyter-vim'}

-- plugin config
require('plugin.treesitter-config')
require('plugin.nvim-tree-config')
require('plugin.complete-config')
-- require('plugin.nvim-compe-config')
require('plugin.vimwiki-config')
require('plugin.telescope-config')
