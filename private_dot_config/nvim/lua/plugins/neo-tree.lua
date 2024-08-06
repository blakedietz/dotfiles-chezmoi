return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
      filesystem = {
        filtered_items = {
          -- Display .gitignored and any hidden files by default
          -- I prefer seeing everything I'm working with vs having things get
          -- "magically" hidden
          -- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/353
          visible = true,
        },
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_current",
      },
    },
  },
}
