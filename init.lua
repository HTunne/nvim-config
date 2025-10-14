-- TODO: dap
-- TODO: obsidian
-- TODO: gitconflict
require('settings')
require('keymap')
require('lsp')
require('obsidian')

vim.pack.add({ 'https://github.com/BirdeeHub/lze' }, { confirm = true })

vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
    data = {
      dep_of = {
        'nvim-treesitter-textobjects',
        'nvim-treesitter-context',
        'nvim-biscuits',
        'treesj',
      },
      after = function()
        vim.api.nvim_create_autocmd('FileType', {
          pattern = { '*.lua', '*.c', '*.cpp' },
          callback = function()
            vim.treesitter.start()
          end,
        })
      end,
    },
  },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
  -- {
  --   src = 'https://github.com/nvim-treesitter/nvim-treesitter-context',
  -- },
  require('plugin.dap'),
  {
    src = 'https://github.com/theHamsta/nvim-dap-virtual-text',
    data = {
      after = function()
        require('nvim-dap-virtual-text').setup()
      end,
      event = 'User NvimDapLoaded',
    },
  },
  {
    src = 'https://github.com/Wansmer/treesj',
    data = {
      after = function()
        vim.keymap.set('n', '<leader>m', function()
          require('treesj').toggle()
        end, { desc = 'split/join' })
      end,
    },
  },
  require('plugin.mini'),
  require('plugin.snacks'),
  {
    src = 'https://github.com/nvim-tree/nvim-web-devicons',
    data = {
      dep_of = {
        'barbar.nvim',
        'lualine.nvim',
      },
    },
  },
  require('plugin.fzf-lua'),
  require('plugin.barbar'),
  {
    name = 'catppuccin',
    src = 'https://github.com/catppuccin/nvim',
    data = {
      colorscheme = 'catppuccin',
      after = function()
        vim.cmd.colorscheme('catppuccin')
      end,
      lazy = false,
    },
  },
  require('plugin.conform'),
  require('plugin.csvview'),
  require('plugin.vim-dispatch'),
  { src = 'https://github.com/radenling/vim-dispatch-neovim' },
  require('plugin.gitsigns'),
  {
    src = 'https://github.com/j-hui/fidget.nvim',
    data = {
      after = function()
        require('fidget').setup()
      end,
    },
  },
  { src = 'https://github.com/rafamadriz/friendly-snippets', data = { dep_of = { 'luasnip' } } },
  require('plugin.luasnip'),
  {
    src = 'https://github.com/Saghen/blink.cmp',
    version = '1.6',
    data = {
      after = function()
        require('blink.cmp').setup({
          snippets = { preset = 'luasnip' },
        })
      end,
    },
  },
  {
    src = 'https://github.com/lukas-reineke/indent-blankline.nvim',
    data = {
      after = function()
        require('ibl').setup()
      end,
    },
  },
  {
    src = 'https://github.com/ggandor/leap.nvim',
    data = {
      after = function()
        vim.keymap.set({ 'n', 'x', 'o' }, '//', '<Plug>(leap)')
      end,
    },
  },
  require('plugin.lualine'),
  {
    src = 'https://github.com/chentoast/marks.nvim',
    data = {
      after = function()
        require('marks').setup()
      end,
    },
  },
  { src = 'https://github.com/nvim-lua/plenary.nvim', data = { dep_of = { 'neogit' } } },
  require('plugin.neogit'),
  {
    src = 'https://github.com/catgoose/nvim-colorizer.lua',
    data = {
      after = function()
        require('colorizer').setup()
      end,
    },
  },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  require('plugin.nvim-lint'),
  require('plugin.oil'),
  require('plugin.todo-comments'),
  {
    src = 'https://github.com/tpope/vim-sleuth',
    data = {
      after = function()
        vim.keymap.set('n', '<leader>s', '<cmd>Sleuth<CR>', { desc = 'run sleuth' })
      end,
    },
  },
  require('plugin.whichkey'),
}, {
  load = function(p)
    local spec = p.spec.data or {}
    spec.name = p.spec.name
    require('lze').load(spec)
  end,
  confirm = true,
})
