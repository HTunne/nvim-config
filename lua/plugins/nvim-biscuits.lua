return {
  'code-biscuits/nvim-biscuits',
  dependancies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    on_events = { 'InsertLeave', 'CursorHoldI' },
  },
}
