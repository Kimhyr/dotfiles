require('lazy').setup({
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,

    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },
    'tpope/vim-fugitive',
    'neovim/nvim-lspconfig',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }
})

require('plugins/gruvbox')
require('plugins/lsp')
require('plugins/telescope')

