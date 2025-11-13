return {
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
        pattern = { 'lua', 'cpp', 'c', 'python', 'javascript' },
        callback = function()
          -- vim.treesitter.start()
        end,
      })
    end,
  },
}
