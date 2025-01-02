return {
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-go",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
  },
  config = function()
    require("go").setup()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true
      },
    })
    require("neotest").setup({
      adapters = {
        require("neotest-go")({
          experimental = {
            test_table = true,
          },
          args = { "-count=1" },
          recursive_run = true,
        })
      },
    })
  end,
  event = {"CmdlineEnter"},
  ft = {"go", "gomod"},
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
