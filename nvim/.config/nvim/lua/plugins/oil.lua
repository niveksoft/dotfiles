return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require "oil"
        oil.setup {
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            float = {
                max_width = 80,
                max_height = 30,
            },
            delete_to_trash = true,
        }

        local function augroup(name)
            return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
        end

        vim.api.nvim_create_autocmd({ "VimEnter" }, {
            group = augroup "oil",
            pattern = ".",
            callback = function()
                oil.open(oil.get_current_dir())
            end,
        })
    end,
    keys = {
        {
            "<leader>e",
            function()
                if vim.bo.filetype == "oil" then
                    require("oil").close()
                else
                    require("oil").open()
                end
            end,
            desc = "Toggle Oil",
        },
    },
}
