return {
  ['<C-n>'] = {
    function()
      if require('luasnip').choice_active() then
        require('luasnip').change_choice(1)
      end
    end,
    'Next choice node',
  },
}
