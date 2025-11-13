return {
  src = 'https://github.com/ggandor/leap.nvim',
  data = {
    after = function()
      vim.keymap.set({ 'n', 'x', 'o' }, '//', '<Plug>(leap)')
    end,
  },
}
