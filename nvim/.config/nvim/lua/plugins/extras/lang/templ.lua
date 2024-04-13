return {

  -- Add templ to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "templ" })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        templ = {
          mason = true,
          settings = {
            vim.filetype.add({ extension = { templ = "templ" } }),
          },
        },
      },
    },
  },
}
