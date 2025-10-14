
vim.keymap.set("n", "<leader>nd", "'saaw]saaw]:e <c-r><c-w>.md'", { expr = true })
vim.keymap.set("v", "<leader>nw", [[:<c-u>lua MiniSurround.add('visual')<cr>[]])
