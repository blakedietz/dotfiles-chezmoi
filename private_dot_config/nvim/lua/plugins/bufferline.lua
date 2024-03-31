return {
  {
    "akinsho/bufferline.nvim",
    -- bj for buffer jump to
    keys = {
      { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "BufferLine: Pick a buffer using a label" },
      { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "BufferLine: Close a buffer using a label" },
      { "<leader>bH", "<cmd>BufferLineMovePrev<cr>", desc = "BufferLine: Move buffer left" },
      { "<leader>bL", "<cmd>BufferLineMoveNext<cr>", desc = "BufferLine: Move buffer right" },
    },
  },
}
