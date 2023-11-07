return {
  'nvim-neorg/neorg',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neorg/neorg-telescope',
  },
  build = ':Neorg sync-parsers',
  cmd = 'Neorg',
  ft = 'norg',
  keys = {
    { '<leader>ni', '<cmd>Neorg index<cr>', desc = 'neorg index' },
    { '<leader>nji', '<cmd>Neorg journal index open<cr>', desc = 'journal toc' },
    { '<leader>nji', '<cmd>Neorg journal index open<cr>', desc = 'journal update toc' },
    { '<leader>nju', '<cmd>Neorg journal index<cr>', desc = 'journal today' },
    { '<leader>njt', '<cmd>Neorg journal today<cr>', desc = 'journal today' },
    { '<leader>njy', '<cmd>Neorg journal yesterday<cr>', desc = 'journal yesterday' },
    { '<leader>njm', '<cmd>Neorg journal tomorrow<cr>', desc = 'journal tomorrow' },
  },
  opts = {
    -- configuration here
    logger = {
      -- level = 'trace', -- Show trace, info, warning, error and fatal messages
    },
    load = {
      ['core.defaults'] = {},
      ['core.concealer'] = {
        config = {
          folds = false,
          icon_preset = 'diamond',
        },
      },
      ['core.completion'] = {
        config = {
          engine = 'nvim-cmp',
        },
      },
      ['core.dirman'] = {
        config = {
          workspaces = {
            notes = '~/norg',
          },
          default_workspace = 'notes',
        },
      },
      ['core.keybinds'] = {
        config = {
          default_keybinds = false,
          neorg_leader = ',',
          hook = function(keybinds)
            -- Map all the below keybinds only when the "norg" mode is active
            keybinds.map_event_to_mode('norg', {
              n = {
                {
                  '<leader>ntu',
                  'core.qol.todo_items.todo.task_undone',
                  opts = { desc = 'Mark as Undone' },
                },
                {
                  '<leader>ntp',
                  'core.qol.todo_items.todo.task_pending',
                  opts = { desc = 'Mark as Pending' },
                },
                {
                  '<leader>ntd',
                  'core.qol.todo_items.todo.task_done',
                  opts = { desc = 'Mark as Done' },
                },
                {
                  '<leader>nth',
                  'core.qol.todo_items.todo.task_on_hold',
                  opts = { desc = 'Mark as On Hold' },
                },
                {
                  '<leader>ntc',
                  'core.qol.todo_items.todo.task_cancelled',
                  opts = { desc = 'Mark as Cancelled' },
                },
                {
                  '<leader>ntr',
                  'core.qol.todo_items.todo.task_recurring',
                  opts = { desc = 'Mark as Recurring' },
                },
                {
                  '<leader>nti',
                  'core.qol.todo_items.todo.task_important',
                  opts = { desc = 'Mark as Important' },
                },
                {
                  '<leader>nta',
                  'core.qol.todo_items.todo.task_ambiguous',
                  opts = { desc = 'Mark as Ambigous' },
                },
                {
                  '<C-Space>',
                  'core.qol.todo_items.todo.task_cycle',
                  opts = { desc = 'Cycle Task' },
                },
                {
                  '<leader>nn',
                  'core.dirman.new.note',
                  opts = { desc = 'Create New Note' },
                },
                {
                  '<CR>',
                  'core.esupports.hop.hop-link',
                  opts = { desc = 'Jump to Link' },
                },
                {
                  'gd',
                  'core.esupports.hop.hop-link',
                  opts = { desc = 'Jump to Link' },
                },
                {
                  'gf',
                  'core.esupports.hop.hop-link',
                  opts = { desc = 'Jump to Link' },
                },
                {
                  'gF',
                  'core.esupports.hop.hop-link',
                  opts = { desc = 'Jump to Link' },
                },
                {
                  '<M-CR>',
                  'core.esupports.hop.hop-link',
                  'vsplit',
                  opts = { desc = 'Jump to Link (Vertical Split)' },
                },
                {
                  '>.',
                  'core.promo.promote',
                  opts = { desc = 'Promote Object (Non-Recursively)' },
                },
                {
                  '<,',
                  'core.promo.demote',
                  opts = { desc = 'Demote Object (Non-Recursively)' },
                },
                {
                  '>>',
                  'core.promo.promote',
                  'nested',
                  opts = { desc = 'Promote Object (Recursively)' },
                },
                {
                  '<<',
                  'core.promo.demote',
                  'nested',
                  opts = { desc = 'Demote Object (Recursively)' },
                },
                {
                  '<leader>nlt',
                  'core.pivot.toggle-list-type',
                  opts = { desc = 'Toggle (Un)ordered List' },
                },
                {
                  '<leader>nli',
                  'core.pivot.invert-list-type',
                  opts = { desc = 'Invert (Un)ordered List' },
                },
                {
                  '<leader>nid',
                  'core.tempus.insert-date',
                  opts = { desc = 'Insert Date' },
                },
              },
              i = {
                {
                  '<C-t>',
                  'core.promo.promote',
                  opts = { desc = 'Promote Object (Recursively)' },
                },
                {
                  '<C-d>',
                  'core.promo.demote',
                  opts = { desc = 'Demote Object (Recursively)' },
                },
                {
                  '<M-CR>',
                  'core.itero.next-iteration',
                  '<CR>',
                  opts = { desc = 'Continue Object' },
                },
                {
                  '<M-d>',
                  'core.tempus.insert-date-insert-mode',
                  opts = { desc = 'Insert Date' },
                },
              },
            }, {
              silent = true,
              noremap = true,
            })

            -- Map the below keys only when traverse-heading mode is active
            keybinds.map_event_to_mode('traverse-heading', {
              n = {
                -- Move to the next heading in the document
                {
                  ']]',
                  'core.integrations.treesitter.next.heading',
                  opts = { desc = 'Move to Next Heading' },
                },

                -- Move to the previous heading in the document
                {
                  '[[',
                  'core.integrations.treesitter.previous.heading',
                  opts = { desc = 'Move to Previous Heading' },
                },
              },
            }, {
              silent = true,
              noremap = true,
            })

            -- Map the below keys on presenter mode
            keybinds.map_event_to_mode('presenter', {
              n = {
                {
                  '<CR>',
                  'core.presenter.next_page',
                  opts = { desc = 'Next Page' },
                },
                {
                  'l',
                  'core.presenter.next_page',
                  opts = { desc = 'Next Page' },
                },
                {
                  'h',
                  'core.presenter.previous_page',
                  opts = { desc = 'Previous Page' },
                },

                -- Keys for closing the current display
                {
                  'q',
                  'core.presenter.close',
                  opts = { desc = 'Close Presentation' },
                },
                {
                  '<Esc>',
                  'core.presenter.close',
                  opts = { desc = 'Close Presentation' },
                },
              },
            }, {
              silent = true,
              noremap = true,
              nowait = true,
            })

            -- Apply the below keys to all modes
            keybinds.map_to_mode('all', {
              n = {
                {
                  '<leader>nmn',
                  ':Neorg mode norg<CR>',
                  opts = { desc = 'Enter Norg Mode' },
                },
                {
                  '<leader>nmh',
                  ':Neorg mode traverse-heading<CR>',
                  opts = { desc = 'Enter Heading Traversal Mode' },
                },
                {
                  'gO',
                  ':Neorg toc split<CR>',
                  opts = { desc = 'Open a Table of Contents' },
                },
              },
            }, {
              silent = true,
              noremap = true,
            })
          end,
        },
      },
      -- ['core.ui.calendar'] = {},
      ['core.integrations.telescope'] = {},
    },
  },
  config = function(_, opts)
    require('neorg').setup(opts)
    vim.wo.conceallevel = 2
    vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
      group = vim.api.nvim_create_augroup('UserNeorg', {}),
      pattern = '*.norg',
      command = 'w',
    })
  end,
}
