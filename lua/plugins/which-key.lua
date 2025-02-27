return {
  'folke/which-key.nvim',
  opts = { plugins = { spelling = { enabled = true } } },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)

    -- leader mappings
    wk.add({
      { '<leader><space>', group = 'hop' },
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
      { '<leader>p', group = 'telescope' },
      { '<leader>pd', group = 'telescope-dap' },
      { '<leader>q', group = 'quarto' },
      { '<leader>qr', group = 'run' },
      { '<leader>r', group = 'dispatch' },
      { '<leader>t', group = 'trouble' },
      { '<c-w>', group = 'window' },
    })
  end,
}
