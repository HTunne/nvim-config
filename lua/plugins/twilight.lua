return {
  'folke/twilight.nvim',
  event = 'InsertEnter',
  config = function()
    require('twilight').setup()
    vim.api.nvim_create_augroup('Twighlight', { clear = true })
    vim.api.nvim_create_autocmd('InsertEnter', { group = 'Twighlight', command = 'TwilightEnable' })
    vim.api.nvim_create_autocmd('InsertLeave', { group = 'Twighlight', command = 'TwilightDisable' })
  end,
}
