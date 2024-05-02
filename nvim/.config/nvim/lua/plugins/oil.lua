return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup {
            float = {
                max_width = 80,
                max_height = 30,
            },
        }
    end,
    keys = {
        {
            "<leader>e",
            function()
                require("oil").toggle_float()
            end,
            desc = "Open Oil",
        },
    },
}
