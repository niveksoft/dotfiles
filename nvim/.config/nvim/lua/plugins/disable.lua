local function disable(package)
    return { package, enabled = false }
end

return {
    disable "catppuccin/nvim",
    disable "rcarriga/nvim-notify",
}
