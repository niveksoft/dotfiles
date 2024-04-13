local bufferline = require("bufferline")

return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    opts.options = {
      always_show_bufferline = true,
      style_preset = bufferline.style_preset.minimal,
      themable = true,
      indicator = {
        -- icon = "▎", -- this should be omitted if indicator style is not 'icon'
        style = "none",
      },
    }
  end,
}
