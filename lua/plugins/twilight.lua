return {
  'folke/twilight.nvim',
  enabled = false,
  event = 'InsertEnter',
  config = function()
    require('twilight').setup()
    vim.api.nvim_create_augroup('UserTwighlight', { clear = true })
    vim.api.nvim_create_autocmd('InsertEnter', { group = 'UserTwighlight', command = 'TwilightEnable' })
    vim.api.nvim_create_autocmd('InsertLeave', { group = 'UserTwighlight', command = 'TwilightDisable' })
  end,
}
