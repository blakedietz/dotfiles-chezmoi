return {
  {
    "fnune/recall.nvim",
    version = "*",
    opts = {
      sign = "",
      sign_highlight = "@comment.note",
    },
    keys = {
      { "<leader>mm", "<cmd>lua require('recall').toggle()<cr>", desc = "Grapple toggle tag" },
      { "<leader>mc", "<cmd>lua require('recall').clear()<cr>", desc = "Grapple toggle tag" },
      { "<leader>ml", "<cmd>Telescope recall<cr>", desc = "" },
      { "<leader>m]", "<cmd>lua require('recall').goto_next()<cr>", desc = "Grapple cycle next tag" },
      { "<leader>m[", "<cmd>lua require('recall').goto_next()<cr>", desc = "Grapple cycle previous tag" },
    },
  },
}
