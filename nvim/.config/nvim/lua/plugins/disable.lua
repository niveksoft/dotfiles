local function disable(package)
    return { package, enabled = false }
end

return {
    disable "folke/tokyonight.nvim",
    -- disable "rcarriga/nvim-notify",
}
