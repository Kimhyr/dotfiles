vim.o.background = 'dark'
require('gruvbox').setup({
    contrast = 'hard',
    italic = {
        strings = false,
        comments = false,
        operators = false
    }
})

vim.cmd('colorscheme gruvbox')

