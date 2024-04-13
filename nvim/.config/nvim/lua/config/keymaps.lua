-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- better escape
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "jk", "<esc>")

-- smartsplits
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

-- lazydocker
-- stylua: ignore
vim.keymap.set("n", "<leader>gd", function() Util.terminal({ "lazydocker" }, { esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazydocker" })

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- move block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up", silent = true })
