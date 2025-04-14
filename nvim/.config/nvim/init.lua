-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic Neovim Options
vim.opt.mouse = 'a' -- Enable mouse mode, useful for resizing
vim.opt.termguicolors = true -- Enable 24-bit colors if the terminal supports it
vim.opt.background = "light" -- Set the background to light
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true -- Highlight the current line
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for (can be overridden by filetype indent)
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent (can be overridden by filetype indent)
vim.opt.expandtab = true -- Use spaces instead of tabs (can be overridden by filetype indent)
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Use smart auto-indenting when starting a new line
vim.opt.wrap = true -- Enable line wrapping
vim.opt.scrolloff = 8 -- Minimum lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- Minimum columns to keep to the left and right of the cursor
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override 'ignorecase' if the search pattern contains upper case characters
vim.opt.hlsearch = true -- Highlight all matches on search
vim.opt.incsearch = true -- Show search results incrementally as you type
vim.opt.undofile = true -- Enable persistent undo
vim.opt.confirm = true -- Raise a dialog asking if you wish to save the current file
vim.opt.backup = false -- Do not create backup files
vim.opt.writebackup = false -- Do not create backup files during write
vim.opt.swapfile = false -- Do not create swap files
vim.opt.updatetime = 250 -- Faster update time for CursorHold events
vim.opt.signcolumn = "yes" -- Always show the sign column
vim.opt.clipboard = "unnamedplus" -- Use system clipboard for copy/paste (requires external clipboard tool)
vim.opt.fillchars = { eob = " " } -- Set end-of-buffer character to space to hide the '~'
vim.opt.list = true -- Show characters defined in listchars
vim.opt.listchars = {
    tab = '▸ ', -- Character for tab (adjust space for alignment)
    trail = '·', -- Character for trailing whitespace
    nbsp = '␣', -- Character for non-breakable space
    extends = '»', -- Character for lines extending past the screen edge
    precedes = '«' -- Character for lines preceding the screen edge
}

-- Enable filetype detection and indentation rules
vim.cmd("filetype plugin indent on")

-- Autocommands

-- Auto-command group for toggling cursorline in Insert mode
local CursorLineGroup = vim.api.nvim_create_augroup("CursorLineToggleGroup", { clear = true })
-- Disable cursorline on entering Insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  group = CursorLineGroup,
  pattern = "*",
  callback = function() vim.wo.cursorline = false end,
  desc = "Disable cursorline in Insert mode"
})
-- Enable cursorline on leaving Insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  group = CursorLineGroup,
  pattern = "*",
  callback = function() vim.wo.cursorline = true end,
  desc = "Enable cursorline when leaving Insert mode"
})

-- Auto-command group for auto-reloading init.lua
local AutoReloadGroup = vim.api.nvim_create_augroup("AutoReloadConfigGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = vim.fn.stdpath("config") .. "/init.lua", -- Pattern to match your init.lua
    command = "source $MYVIMRC", -- Command to source the config file
    group = AutoReloadGroup,
    desc = "Automatically reload init.lua after saving",
})

-- Function to remove trailing whitespace and preserve cursor position
local function TrimWhitespace()
    local current_win = vim.api.nvim_get_current_win()
    local current_cursor = vim.api.nvim_win_get_cursor(current_win)
    -- Use try-catch to handle potential errors during substitution, though unlikely with '%s'
    local success, _ = pcall(vim.cmd, [[%s/\s\+$//e]])
    if success then
        -- Only restore cursor if the command succeeded
        vim.api.nvim_win_set_cursor(current_win, current_cursor)
    else
        print("Error removing trailing whitespace.")
    end
end

-- Auto-command group for whitespace trimming
local TrimWhitespaceGroup = vim.api.nvim_create_augroup("TrimWhitespaceGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*", -- Apply to all file types
    callback = TrimWhitespace, -- Call the Lua function
    group = TrimWhitespaceGroup,
    desc = "Remove trailing whitespace",
})

-- Function to toggle the Netrw file explorer in a vertical split
local function ToggleNetrw()
    if vim.bo.filetype == 'netrw' then
        -- If current buffer is Netrw, close it
        vim.cmd('q')
    else
        -- Set the desired width percentage for the vertical split (e.g., 30%)
        -- This makes the initial size relative to the terminal width.
        -- vim.g.netrw_winsize = 30
        -- Open Netrw in a vertical split
        vim.cmd('Vex')
    end
end

-- Auto-command group for higlight on yank
local HighlightYankGroup = vim.api.nvim_create_augroup("HighlightYankGroup", {clear = true})
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = HighlightYankGroup,
    desc = "Highlight on yank",
})

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath) -- Add lazy.nvim to runtime path

-- Terminal mode mappings
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true, desc = "Exit terminal mode" })
vim.keymap.set('t', '<A-t>', '<C-\\><C-n><C-^>', { noremap = true, silent = true, desc = "Switch to alternate file" })

-- Normal mode mappings
vim.keymap.set('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true, desc = "Clear search highlight" })
vim.keymap.set('n', '<leader>e', ToggleNetrw, { noremap = true, silent = true, desc = "Explore files" }) -- Use built-in Netrw file explorer
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true, desc = "Quit window" })
vim.keymap.set('n', '<leader>qa', ':qa<CR>', { noremap = true, silent = true, desc = "Quit all" })
vim.keymap.set('n', '<A-t>', '<C-^>', { noremap = true, silent = true, desc = "Switch to alternate file" })

-- Tab management mappings
vim.keymap.set('n', '<leader>tt', ':tabnew %<CR>', { noremap = true, silent = true, desc = "New tab with current file" })
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { noremap = true, silent = true, desc = "Next tab" })
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { noremap = true, silent = true, desc = "Previous tab" })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true, desc = "Close tab" })

-- Window management mappings
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true, desc = "Split vertically" })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true, desc = "Split horizontally" })

require("lazy").setup({
    {
        'mrjones2014/smart-splits.nvim',
        config = function()
            require('smart-splits').setup({})

            local function safe_require(mod)
                local ok, M = pcall(require, mod)
                if ok then return M end
                return nil
            end

            local smart_splits = safe_require('smart-splits')

            if smart_splits then
                -- Resize
                vim.keymap.set('n', '<A-h>', smart_splits.resize_left, { noremap = true, silent = true, desc = "Resize left" })
                vim.keymap.set('n', '<A-j>', smart_splits.resize_down, { noremap = true, silent = true, desc = "Resize down" })
                vim.keymap.set('n', '<A-k>', smart_splits.resize_up, { noremap = true, silent = true, desc = "Resize up" })
                vim.keymap.set('n', '<A-l>', smart_splits.resize_right, { noremap = true, silent = true, desc = "Resize right" })

                -- Moving between splits
                vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left, { noremap = true, silent = true, desc = "Move to left window" })
                vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down, { noremap = true, silent = true, desc = "Move to lower window" })
                vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up, { noremap = true, silent = true, desc = "Move to upper window" })
                vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right, { noremap = true, silent = true, desc = "Move to right window" })

                -- Swapping buffers between windows
                vim.keymap.set('n', '<leader><leader>h', smart_splits.swap_buf_left, { noremap = true, silent = true, desc = "Swap to left window" })
                vim.keymap.set('n', '<leader><leader>j', smart_splits.swap_buf_down, { noremap = true, silent = true, desc = "Swap to lower window" })
                vim.keymap.set('n', '<leader><leader>k', smart_splits.swap_buf_up, { noremap = true, silent = true, desc = "Swap to upper window" })
                vim.keymap.set('n', '<leader><leader>l', smart_splits.swap_buf_right, { noremap = true, silent = true, desc = "Swap to right window" })
            else
                vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = "Move to left window" })
                vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = "Move to lower window" })
                vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = "Move to upper window" })
                vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = "Move to right window" })
            end
        end
    },
})

local ok, theme_module = pcall(require, 'custom.theme')
if ok and theme_module and theme_module.apply then
    theme_module.apply()
else
    print("Error loading custom theme from lua/custom/theme.lua. Using default.")
    vim.cmd [[colorscheme default]]
end
