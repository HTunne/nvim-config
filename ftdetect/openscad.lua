-- if exists("b:did_ftplugin")
-- echo "hello"
-- finish
-- endif

vim.bo.commentstring = '// %s'

-- au BufRead,BufNewFile *.scad    setfiletype openscad

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, { pattern = '.scad', command = 'setfiletype openscad' })
