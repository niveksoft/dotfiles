return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                mode = "buffers",
                separator_style = "thin",
                show_buffer_close_icons = false,
                show_close_icon = false,
                color_icons = true,
                show_tab_indicators = false,
                enforce_regular_tabs = false,
                modified_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 18,
                max_prefix_length = 15,
                truncate_names = true,
                tab_size = 18,
                diagnostics = false,
                offsets = {
                    {
                        filetype = "oil",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                    },
                },
                indicator = {
                    icon = "▎", -- this should be omitted if indicator style is not 'icon'
                    style = "icon",
                },
                buffer_close_icon = "",
                always_show_bufferline = true,
                hover = {
                    enabled = false,
                },
            },
            highlights = {
                buffer_selected = {
                    bold = true,
                    italic = false,
                },
                indicator_selected = {
                    fg = { attribute = "fg", highlight = "Function" },
                    italic = false,
                },
                separator = {
                    fg = { attribute = "bg", highlight = "Normal" },
                    bg = { attribute = "bg", highlight = "Normal" },
                },
                separator_selected = {
                    fg = { attribute = "bg", highlight = "Normal" },
                    bg = { attribute = "bg", highlight = "Normal" },
                },
                separator_visible = {
                    fg = { attribute = "bg", highlight = "Normal" },
                    bg = { attribute = "bg", highlight = "Normal" },
                },
                close_button = {
                    fg = { attribute = "fg", highlight = "Normal" },
                    bg = { attribute = "bg", highlight = "Normal" },
                },
                close_button_selected = {
                    fg = { attribute = "fg", highlight = "Normal" },
                    bg = { attribute = "bg", highlight = "Normal" },
                },
                close_button_visible = {
                    fg = { attribute = "fg", highlight = "Normal" },
                    bg = { attribute = "bg", highlight = "Normal" },
                },
                background = {
                    fg = { attribute = "fg", highlight = "Comment" },
                    bg = { attribute = "bg", highlight = "Normal" },
                },
                fill = {
                    bg = { attribute = "bg", highlight = "Normal" },
                },
            },
        },
    },
}
