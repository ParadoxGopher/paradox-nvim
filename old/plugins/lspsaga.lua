return {
  "nvimdev/lspsaga.nvim",
  after = "nvim-lspconfig",
  opts = {
    lightbulb = {
      enable = false,
    }
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
