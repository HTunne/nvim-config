return {
  ['<A-,>'] = { '<cmd>BufferPrevious<cr>', 'goto previous buffer' },
  ['<A-.>'] = { '<cmd>BufferNext<cr>', 'got next buffer' },
-- Re-order to previous/next
  ['<A-<>'] = { '<cmd>BufferMovePrevious<cr>', 'move buffer left' },
  ['<A->>'] = { '<cmd>BufferMoveNext<cr>', 'move buffer right' },
-- Goto buffer in position...
  ['<A-1>'] = { '<cmd>BufferGoto 1<cr>', 'goto buffer 1' },
  ['<A-2>'] = { '<cmd>BufferGoto 2<cr>', 'goto buffer 2' },
  ['<A-3>'] = { '<cmd>BufferGoto 3<cr>', 'goto buffer 3' },
  ['<A-4>'] = { '<cmd>BufferGoto 4<cr>', 'goto buffer 4' },
  ['<A-5>'] = { '<cmd>BufferGoto 5<cr>', 'goto buffer 5' },
  ['<A-6>'] = { '<cmd>BufferGoto 6<cr>', 'goto buffer 6' },
  ['<A-7>'] = { '<cmd>BufferGoto 7<cr>', 'goto buffer 7' },
  ['<A-8>'] = { '<cmd>BufferGoto 8<cr>', 'goto buffer 8' },
  ['<A-9>'] = { '<cmd>BufferGoto 9<cr>', 'goto buffer 9' },
  ['<A-0>'] = { '<cmd>BufferLast<cr>', 'goto last buffer' },
-- Close buffer
  ['<A-c>'] = { '<cmd>BufferClose<cr>', 'close buffer' },
-- Wipeout buffer
  ['<A-w>'] = { '<cmd>BufferWipeout<cr>', 'buffer wipeout' },
-- Close commands
  ['<A-C>'] = { '<cmd>BufferCloseAllButCurrent<cr>', 'close all but current buffer' },
  ['<A-h>'] = { '<cmd>BufferCloseBuffersLeft<cr>', 'close buffers left' },
  ['<A-l>'] = { '<cmd>BufferCloseBuffersRight<cr>', 'close buffers right' },
-- Magic buffer-picking mode
  ['<A-p>'] = { '<cmd>BufferPick<cr>', 'pick buffer' },
-- Sort automatically by...
  ['<leader>'] = {
    ['b'] = {
      name = '+buffers',
      ['b'] = { '<cmd>BufferOrderByBufferNumber<cr>', 'sort buffers by number' },
      ['d'] = { '<cmd>BufferOrderByDirectory<cr>', 'sort buffers by dir' },
      ['l'] = { '<cmd>BufferOrderByLanguage<cr>', 'sort buffers by language' },
    }
  }
}
