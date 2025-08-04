local function mark_status()
    local marks = vim.fn.getmarklist(vim.fn.bufnr "%")
    local result = {}
    for _, mark in ipairs(marks) do
        if mark.mark:match "[a-z]" then
            table.insert(result, mark.mark)
        end
    end

    return table.concat(result, " ")
end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        local custom_everforest = require "lualine.themes.everforest"
        -- match terminal everforest background
        custom_everforest.command.c.bg = "#2d353c"
        custom_everforest.insert.c.bg = "#2d353c"
        custom_everforest.normal.c.bg = "#2d353c"
        custom_everforest.replace.c.bg = "#2d353c"
        custom_everforest.terminal.c.bg = "#2d353c"
        custom_everforest.visual.c.bg = "#2d353c"

        return {
            options = {
                theme = custom_everforest,
                component_separators = "",
                section_separators = "",
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha", "oil" } },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diagnostics" },
                lualine_c = {
                    "%=",
                    { "filetype", icon_only = true, padding = { left = 0, right = 0 } },
                    { "filename", padding = { left = 0, right = 0 } },
                    mark_status,
                },
                lualine_x = {},
                lualine_y = {
                    "progress",
                },
                lualine_z = {
                    "location",
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },

            extensions = { "lazy", "toggleterm", "mason", "trouble" },
        }
    end,
}
