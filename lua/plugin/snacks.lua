return {
  src = 'https://github.com/folke/snacks.nvim',
  data = {
    after = function()
      require('snacks').setup({
        bigfile = { enabled = true },
        dashboard = {
          enabled = true,
          sections = {
            { section = 'header' },
            { section = 'keys', gap = 1, padding = 1 },
            {
              section = 'terminal',
              gap = 1,
              padding = 1,
              icon = ' ',
              title = 'Git Status',
              cmd = 'git --no-pager diff --stat -B -M -C',
              ttl = 5 * 60,
              height = 10,
            },
          },
        },
        dim = {
          enabled = true,
          animate = {
            enabled = false,
          },
        },
        indent = {
          enabled = false,
          animate = {
            enabled = false,
          },
        },
        input = { enabled = true },
        image = { enabled = true },
        notifier = {
          enabled = true,
          timeout = 3000,
        },
        quickfile = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        styles = {
          notification = {
            -- wo = { wrap = true } -- Wrap notifications
          },
        },
      })
    end,

    -- beforeAll = function()
    --   vim.api.nvim_create_augroup('UserDim', { clear = true })
    --   vim.api.nvim_create_autocmd('InsertEnter', {
    --     group = 'UserDim',
    --     callback = function()
    --       Snacks.dim.enable()
    --     end,
    --   })
    --   vim.api.nvim_create_autocmd('InsertLeave', {
    --     group = 'UserDim',
    --     callback = function()
    --       Snacks.dim.disable()
    --     end,
    --   })
    -- end,
  },
}
