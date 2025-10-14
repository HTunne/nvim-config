return {
  src = 'https://github.com/folke/which-key.nvim',
  data = {
    after = function()
      local wk = require('which-key')
      wk.setup({ plugins = { spelling = { enabled = true } } })

      -- leader mappngs
      wk.add({
        { '<leader>b', group = 'buffers' },
        { '<leader>d', group = 'dap' },
        { '<leader>do', group = 'osv' },
        { '<leader>dp', group = 'python' },
        { '<leader>dr', group = 'repl' },
        { '<leader>ds', group = 'set breakpoint' },
        { '<leader>h', group = 'gitsigns' },
        { '<leader>ht', group = 'toggle' },
        { '<leader>i', group = 'diagnostic' },
        { '<leader>l', group = 'lsp' },
        { '<leader>n', group = 'obsidian' },
        { '<leader>f', group = 'find' },
        { '<leader>fd', group = 'telescope-dap' },
        { '<leader>r', group = 'dispatch' },
        { '<c-w>', group = 'window' },
      })
    end,
  },
}
