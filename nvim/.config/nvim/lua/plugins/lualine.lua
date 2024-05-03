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
        return {
            options = {
                component_separators = "",
                section_separators = "",
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diagnostics" },
                lualine_c = { "%=", "filename", "harpoon2", mark_status },
                lualine_x = {
                    "filetype",
                },
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

            extensions = { "lazy", "toggleterm", "mason", "oil", "trouble" },
        }
    end,
}
