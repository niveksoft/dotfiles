return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    popup_border_style = "rounded",
    enable_normal_mode = true,
    window = {
      position = "float",
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
    },
  },
}
