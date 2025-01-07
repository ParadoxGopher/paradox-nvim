return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics",
    },
    {
      "<leader>tj",
      "<cmd>Trouble diagnostics jump<cr>",
      desc = "Jump to trouble",
    },
    {
      "<leader>tN",
      "<cmd>Trouble diagnostics next<cr>",
      desc = "select next trouble",
    },
    {
      "<leader>tn",
      "<cmd>Trouble diagnostics next<cr><cmd>Trouble diagnostics jump<cr>",
      desc = "select next trouble and jump",
    },
    {
      "<leader>tP",
      "<cmd>Trouble diagnostics prev<cr>",
      desc = "select previous trouble",
    },
    {
      "<leader>tp",
      "<cmd>Trouble diagnostics prev<cr><cmd>Trouble diagnostics jump<cr>",
      desc = "select previous trouble and jump",
    },
    {
      "<leader>tr",
      "<cmd>Trouble diagnostics refresh<cr>",
      desc = "refresh trouble",
    },
    {
      "<leader>xq",
      "cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List"
    },
  },
}
