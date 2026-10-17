return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Explorer",
    },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "Git Explorer",
    },
  },
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  opts = {
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["P"] = { "toggle_preview", config = { use_float = true } },
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
}
