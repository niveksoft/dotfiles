return {
    "mrjones2014/smart-splits.nvim",
    config = function()
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
    end,
}
