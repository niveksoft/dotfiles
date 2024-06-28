-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local util = require "lazyvim.util"

-- Lazydocker
-- stylua: ignore
vim.keymap.set("n", "<leader>gd", function() util.terminal({ "lazydocker" }, { esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazydocker" })
