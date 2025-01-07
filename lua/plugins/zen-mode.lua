return {
  'folke/zen-mode.nvim',
  enabled = false,
  keys = {
    { '<leader>z', function() require('zen-mode').toggle() end, desc = 'zen mode' },
  },
}
