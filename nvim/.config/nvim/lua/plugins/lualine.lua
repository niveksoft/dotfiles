return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options = {
      component_separators = "|",
      -- section_separators = "",
      section_separators = { left = "", right = "" },
    }

    -- remove navic
    -- table.remove(opts.sections.lualine_c, 4)
  end,
}
