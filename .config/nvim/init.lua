local k = vim.keymap
local o = vim.o
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

-- Indentation
o.tabstop = 8
o.softtabstop = 8
o.shiftwidth = 8
o.expandtab = false 
o.smarttab = true

-- Lines 
o.number = true
o.relativenumber = true
o.numberwidth = 6
o.wrap = true 
o.scrolloff = 8

-- Files
o.swapfile = false
o.backup = false

-- Searching
o.hlsearch = false
o.incsearch = true 

-- Colors
o.termguicolors = true
o.colorcolumn = "80"

-- Other
o.updatetime = 50

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  "nvim-treesitter/nvim-treesitter",
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  "terryma/vim-multiple-cursors",
  "ellisonleao/gruvbox.nvim"
}

-- Theme
require("gruvbox").setup {
  italic = {
    strings = false,
    comments = false,
    operators = false,
    folds = false,
  },
  contrast = "hard"
}

vim.cmd("colorscheme gruvbox")

require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp", "rust", "lua" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  }
}

-- Searching
local fzf = require("telescope.builtin") 
k.set("n", "<Leader>ff", fzf.find_files, {}) 
k.set("n", "<Leader>fg", fzf.live_grep, {})
k.set("n", "<Leader>fb", fzf.buffers, {})
k.set("n", "<Leader>fh", fzf.help_tags, {})

require("telescope").load_extension "file_browser"

k.set("n", "<Leader>fe", ":Telescope file_browser<CR>", { noremap = true})

