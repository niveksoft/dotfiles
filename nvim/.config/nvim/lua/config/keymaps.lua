-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local util = require "lazyvim.util"

-- Lazydocker
-- stylua: ignore
vim.keymap.set("n", "<leader>gd", function() util.terminal({ "lazydocker" }, { esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazydocker" })

-- vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })
-- vim.keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Close Other Tabs" })
-- vim.keymap.set("n", "<S-l>", "<cmd>tabnext<CR>", { desc = "Next Tab" })
-- vim.keymap.set("n", "<S-h>", "<cmd>tabprevious<CR>", { desc = "Prev Tab" })

-- Setting the keymaps here instead of in the plugin spec as its getting overriden
local splits = require "smart-splits"

-- Resizing splits
vim.keymap.set("n", "<A-h>", splits.resize_left)
vim.keymap.set("n", "<A-j>", splits.resize_down)
vim.keymap.set("n", "<A-k>", splits.resize_up)
vim.keymap.set("n", "<A-l>", splits.resize_right)

-- Moving between splits
vim.keymap.set("n", "<C-h>", splits.move_cursor_left)
vim.keymap.set("n", "<C-j>", splits.move_cursor_down)
vim.keymap.set("n", "<C-k>", splits.move_cursor_up)
vim.keymap.set("n", "<C-l>", splits.move_cursor_right)
vim.keymap.set("n", "<C-\\>", splits.move_cursor_previous)

-- Swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", splits.swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", splits.swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", splits.swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", splits.swap_buf_right)
