return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                always_show_bufferline = false,
                hover = { enabled = false },
                buffer_close_icon = "",
                close_command = "bdelete! %d",
                close_icon = "",
                color_icons = true,
                diagnostics = false,
                enforce_regular_tabs = false,
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                left_mouse_command = "buffer %d",
                left_trunc_marker = "",
                max_name_length = 18,
                max_prefix_length = 15,
                middle_mouse_command = nil,
                mode = "buffers",
                modified_icon = "●",
                numbers = "none",
                offsets = {
                    {
                        filetype = "oil",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                    },
                },
                right_mouse_command = "vertical sbuffer %d",
                right_trunc_marker = "",
                separator_style = "thin",
                show_buffer_close_icons = true,
                show_close_icon = false,
                show_tab_indicators = false,
                tab_size = 18,
                truncate_names = true,
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
