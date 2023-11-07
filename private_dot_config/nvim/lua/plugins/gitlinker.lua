return {
  {
    "ruifm/gitlinker.nvim",
    config = true,
    keys = {
      {
        "<leader>gl",
        '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
        desc = "Link to line in GitHub",
        mode = { "n" },
      },
      {
        "<leader>gb",
        '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
        mode = { "n" },
      },
      {
        "<leader>gb",
        '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
        mode = { "v" },
      },
    },
  },
}
