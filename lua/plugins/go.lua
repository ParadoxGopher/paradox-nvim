return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    -- "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      lsp_cfg = {
        settings = {
          gopls = {
            usePlaceholders = false,
            diagnosticsTrigger = "Edit",
            diagnosticsDelay = "250ms",
          },
        },
      },
      lsp_keymaps = false,
      lsp_on_attach = function(client, bufnr)
        require("go.lsp").gopls_on_attach(client, bufnr)
        vim.api.nvim_set_current_dir(client.config.root_dir)
        vim.env.PATH = vim.env.PATH .. ":" .. client.config.root_dir
        vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = bufnr, desc = "goto definition" })
      end,
      trouble = true,
      diagnostic = false,
      lsp_inlay_hints = {
        enable = false,
      },
    })
    vim.keymap.set("n", "<leader> ", "<cmd>GoCodeAction<cr>", { desc = "code action ", remap = false })
    vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<cr>", { desc = "find reference" })
  end,
  -- event = {"CmdlineEnter"},
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
