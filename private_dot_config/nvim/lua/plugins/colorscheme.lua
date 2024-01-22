return {
  {
    "folke/tokyonight.nvim",
    cond = not vim.g.vscode,
    opts = {
      style = "night",
      dim_inactive = true,
      on_highlights = function(hl, c)
        -- Make borders slightly more legible VertSplit didn't seem to do anything
        hl.WinSeparator = {
          fg = c.cyan,
        }
      end,
    },
  },
}
