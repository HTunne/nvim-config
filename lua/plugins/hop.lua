return {
  'phaazon/hop.nvim',
  config = true,
  keys = {
    {
      '<leader><leader>w',
      function()
        local hop = require('hop')
        local dir = require('hop.hint').HintDirection
        hop.hint_words({ direction = dir.AFTER_CURSOR })
      end,
      desc = 'hop word forward',
    },
    {
      '<leader><leader>b',
      function()
        local hop = require('hop')
        local dir = require('hop.hint').HintDirection
        hop.hint_words({ direction = dir.BEFORE_CURSOR })
      end,
      desc = 'hop word backward',
    },
    {
      '<leader><leader>f',
      function()
        local hop = require('hop')
        local dir = require('hop.hint').HintDirection
        hop.hint_char1({ direction = dir.AFTER_CURSOR })
      end,
      desc = 'hop char forward',
    },
    {
      '<leader><leader>F',
      function()
        local hop = require('hop')
        local dir = require('hop.hint').HintDirection
        hop.hint_char1({ direction = dir.BEFORE_CURSOR })
      end,
      desc = 'hop char backward',
    },
    {
      '<leader><leader>j',
      function()
        local hop = require('hop')
        local dir = require('hop.hint').HintDirection
        hop.hint_lines_skip_whitespace({ direction = dir.AFTER_CURSOR })
      end,
      desc = 'hop char down',
    },
    {
      '<leader><leader>k',
      function()
        local hop = require('hop')
        local dir = require('hop.hint').HintDirection
        hop.hint_lines_skip_whitespace({ direction = dir.BEFORE_CURSOR })
      end,
      desc = 'hop line up',
    },
    {
      '<leader><leader>n',
      function()
        local hop = require('hop')
        local dir = require('hop.hint').HintDirection
        hop.hint_patterns()
      end,
      desc = 'hop search',
    },
    {
      '<leader><leader>N',
      function()
        local hop = require('hop')
        local dir = require('hop.hint').HintDirection
        hop.hint_patterns({ direction = dir.BEFORE_CURSOR })
      end,
      desc = 'hop search backward',
    },
  },
}
