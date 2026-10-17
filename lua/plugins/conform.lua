return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        html = { "djlint" },
        go = { "goimports" },
      },
      formatters = {
        djlint = {
          prepend_args = { "--profile=golang" },
        },
      },
      -- HTML templates are slow to format, so format them asynchronously
      -- after the save; everything else formats synchronously before it.
      format_on_save = function(bufnr)
        if vim.bo[bufnr].filetype == "html" then
          return nil
        end
        return {
          timeout_ms = 2000,
          lsp_format = "fallback",
        }
      end,
      format_after_save = function(bufnr)
        if vim.bo[bufnr].filetype ~= "html" then
          return nil
        end
        return {
          timeout_ms = 5000,
          lsp_format = "fallback",
        }
      end,
    })
  end,
}
