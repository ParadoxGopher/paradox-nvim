return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        html = { "djlint" }
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 2000,
        lsp_format = "fallback",
      },
    })
  end,
}
