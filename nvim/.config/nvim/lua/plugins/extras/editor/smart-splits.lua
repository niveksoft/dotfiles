return {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    keys = function()
        local splits = require "smart-splits"

        return {
            -- Resizing splits
            { "<A-h>", mode = { "n" }, splits.resize_left },
            { "<A-l>", mode = { "n" }, splits.resize_right },
            { "<A-j>", mode = { "n" }, splits.resize_down },
            { "<A-k>", mode = { "n" }, splits.resize_up },

            -- Moving between splits
            { "<C-h>", mode = { "n" }, splits.move_cursor_left },
            { "<C-l>", mode = { "n" }, splits.move_cursor_right },
            { "<C-j>", mode = { "n" }, splits.move_cursor_down },
            { "<C-k>", mode = { "n" }, splits.move_cursor_up },
            { "<C-\\", mode = { "n" }, splits.move_cursor_previous },

            -- Swapping buffers between windows
            { "<leader><leader>h", mode = { "n" }, splits.swap_buf_left },
            { "<leader><leader>l", mode = { "n" }, splits.swap_buf_right },
            { "<leader><leader>j", mode = { "n" }, splits.swap_buf_down },
            { "<leader><leader>k", mode = { "n" }, splits.swap_buf_up },
        }
    end,
}
