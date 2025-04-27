-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local util = require "lazyvim.util"

-- Lazydocker
vim.keymap.set("n", "<leader>gd", function()
    util.terminal({ "lazydocker" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazydocker" })

-- Formatting
vim.keymap.set("n", "<leader>co", function()
    local buffer_format = vim.b.autoformat
    -- If buffer_format is nil (unset), treat it as true since that's LazyVim's default
    buffer_format = buffer_format == nil and true or buffer_format
    vim.b.autoformat = not buffer_format
    vim.notify("Autoformat " .. (vim.b.autoformat == true and "enabled" or "disabled"), vim.log.levels.INFO)
end, { desc = "Toggle formatting on current buffer" })
