return {
  "ray-x/go.nvim",
  after = "nvim-lspconfig",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest",
    "fredrikaverpil/neotest-golang",
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
  },
  config = function()
    require("go").setup({
      lsp_cfg = true,
      lsp_keymaps = true,
      trouble = true,
    })
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true
      },
    })
    require("neotest").setup({
      adapters = {
        require("neotest-golang")({
          go_test_args = {
            "-v",
            "-count=1",
          },
        })
      },
    })
    vim.keymap.set("n", "<leader> ", "<cmd>GoCodeAction<cr>", { desc = "code action ", remap = false })
    vim.keymap.set("n", "<leader>gtt", require("neotest").run.run, { desc = "run closest test" })
    vim.keymap.set("n", "<leader>gta", function()
      require("neotest").run.run(".")
    end, { desc = "run all tests" })
    vim.keymap.set("n", "<leader>gts", require("neotest").summary.toggle, { desc = "toggle test summary" })

    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function ()
        require('go.format').goimports()
      end,
      group = format_sync_grp
    })
  end,
  -- event = {"CmdlineEnter"},
  ft = {"go", "gomod"},
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
