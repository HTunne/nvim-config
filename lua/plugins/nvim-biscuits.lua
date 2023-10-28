return {
  'code-biscuits/nvim-biscuits',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    on_events = { 'InsertLeave', 'CursorHoldI' },
    language_config = {
      vimdoc = {
        disabled = true,
      },
    },
  },
}
