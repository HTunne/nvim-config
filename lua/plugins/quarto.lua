return {
  'quarto-dev/quarto-nvim',
  ft = { 'quarto' },
  dev = false,
  keys = {
    { '<leader>qa', '<CMD>QuartoActivate<cr>', desc = 'activate quarto' },
    { '<leader>qp', "<CMD>lua require'quarto'.quartoPreview()<cr>", desc = 'open preview' },
    { '<leader>qq', "<CMD>lua require'quarto'.quartoClosePreview()<cr>", desc = 'close preview' },
    { '<leader>qh', '<CMD>QuartoHelp ', desc = 'help' },
    { '<leader>qrr', '<CMD>QuartoSendAbove<cr>', desc = 'to cursor' },
    { '<leader>qra', '<CMD>QuartoSendAll<cr>', desc = 'all' },
    { '<leader>qrb', '<CMD>QuartoSendBelow<cr>', desc = 'after cursor' },
    { '<leader>qe', "<CMD>lua require('otter').export()<cr>", desc = 'export' },
    { '<leader>qE', "<CMD>lua require('otter').export(true)<cr>", desc = 'export with overwrite' },
  },
  opts = {
    lspFeatures = {
      languages = { 'r', 'python', 'julia', 'bash', 'lua', 'html', 'dot', 'javascript', 'typescript', 'ojs' },
    },
    codeRunner = {
      enabled = true,
      default_method = 'slime',
    },
  },
  dependencies = {
    {
      'jmbuhr/otter.nvim',
      dev = false,
      dependencies = {
        { 'neovim/nvim-lspconfig' },
      },
      opts = {
        buffers = {
          set_filetype = true,
        },
        handle_leading_whitespace = true,
      },
    },
    {
      'jpalardy/vim-slime',
      init = function()
        vim.b['quarto_is_python_chunk'] = false
        Quarto_is_in_python_chunk = function()
          require('otter.tools.functions').is_otter_language_context('python')
        end

        vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
      return [a:text, "\n"]
      else
      return [a:text]
      end
      end
      endfunction
      ]])

        local function mark_terminal()
          vim.g.slime_last_channel = vim.b.terminal_job_id
          vim.print(vim.g.slime_last_channel)
        end

        local function set_terminal()
          vim.b.slime_config = { jobid = vim.g.slime_last_channel }
        end

        vim.g.slime_target = 'neovim'
        vim.g.slime_python_ipython = 1

        require('which-key').register({
          ['<leader>cm'] = { mark_terminal, 'mark terminal' },
          ['<leader>cs'] = { set_terminal, 'set terminal' },
        })
      end,
    },
    {
      'benlubas/molten-nvim',
      dependencies = {},
      enabled = false,
      build = ':UpdateRemotePlugins',
      init = function()
        -- vim.g.molten_image_provider = 'image.nvim'
        vim.g.molten_output_win_max_height = 20
        vim.g.molten_auto_open_output = false
      end,
      keys = {
        { '<leader>mi', ':MoltenInit<cr>', desc = '[m]olten [i]nit' },
        {
          '<leader>mv',
          ':<C-u>MoltenEvaluateVisual<cr>',
          mode = 'v',
          desc = 'molten eval visual',
        },
        { '<leader>mr', ':MoltenReevaluateCell<cr>', desc = 'molten re-eval cell' },
      },
    },
  },
}
