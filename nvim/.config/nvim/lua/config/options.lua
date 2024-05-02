-- See `:help vim-opt`
-- See `:help option-list`

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Enable true colors
vim.opt.termguicolors = true

-- Use vim-sleuth for indents and widths
vim.opt.expandtab = false -- use spaces instead of tabs
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true

-- Display signs always
vim.opt.signcolumn = "yes"

-- Already shown in status line
vim.opt.showmode = false

-- Sync clipboard with OS
vim.opt.clipboard = "unnamedplus"

-- Repeat indent when line wraps
vim.opt.breakindent = true

-- Disable annoying swapfile for buffers
vim.opt.swapfile = false

-- Save undo history
vim.opt.undofile = true

-- Open splits to the right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Configure how whitespace characters are displayed
-- See `:help 'list'`
-- See `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimum number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.smoothscroll = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Highlight screenline of the cursor
vim.opt.cursorline = true

-- Preview substitutions live as you type in quicklist
-- vim.opt.inccommand = "split"

-- Highlight Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show matching brackets
vim.opt.showmatch = true

-- No bells allowed
vim.opt.belloff = "all"
