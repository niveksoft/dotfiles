return {
    { "nvim-neo-tree/neo-tree.nvim", enabled = false },
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function()
            local oil = require "oil"

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

            return {
                columns = {
                    "icon",
                    "permissions",
                    -- "size",
                    -- "mtime",
                },
                float = {
                    max_width = 80,
                    max_height = 30,
                },
                delete_to_trash = true,
                view_options = {
                    show_hidden = true,
                },
            }
        end,
        keys = {
            {
                "<leader>e",
                function()
                    if vim.bo.filetype == "oil" then
                        require("oil").close()
                    else
                        require("oil").open_float()
                    end
                end,
                desc = "Toggle Oil",
            },
        },
    },
}
