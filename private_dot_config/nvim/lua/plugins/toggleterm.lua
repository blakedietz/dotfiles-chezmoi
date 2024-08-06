return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = 20,
      direction = "horizontal",
      auto_scroll = false,
    },
    config = true,
    keys = {
      {
        "<Leader>T",
        function()
          require("toggleterm").toggle(vim.v.count1)
        end,
        desc = "Toggleterm: toggle window",
      },
      {
        "<Leader>Ta",
        function()
          require("toggleterm").toggle_all()
        end,
        desc = "Toggleterm: toggle all windows",
      },
    },
    lazy = false,
  },
}
