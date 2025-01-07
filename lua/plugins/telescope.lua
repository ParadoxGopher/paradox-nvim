return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  command = "Telescope",
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "find file",
    },
    {
      "<leader>fr",
      "<cmd>Telescope grep_string<cr>",
      desc = "find in files",
    },
  },
}
