return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          CursorLine = { bg = colors.none },
          CursorLineNr = { bg = colors.none },
          FloatShadow = { bg = colors.none },
          FloatShadowThrough = { bg = colors.none },
          NormalFloat = { bg = colors.none },
        }
      end,
      integrations = {
        navic = {
          enable = true,
          custom_bg = "NONE", -- remove the lazyvim custom bg in transparent_background
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
