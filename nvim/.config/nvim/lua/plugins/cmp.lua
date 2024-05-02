return {
    "hrsh7th/nvim-cmp",
    dependencies = { "MattiasMTS/cmp-dbee", ft = "sql" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
        table.insert(opts.sources, { name = "cmp-dbee" })
    end,
}
