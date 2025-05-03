return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "html", "css", "javascript" } },
    },

    {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "html-lsp", "prettierd" } },
    },

    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                html = { "prettierd" },
                css = { "prettierd" },
                javascript = { "prettierd" },
            },
        },
    },
}
