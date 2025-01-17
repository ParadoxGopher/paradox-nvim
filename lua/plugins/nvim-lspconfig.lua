return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
  config = function ()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.diagnostic.config({
      float = {
        source = true,
      },
      virtual_text = {
        virt_text_pos = "right_align",
      },
      signs = true,
      underline = true,
      severity_sort = true,
    })

    local function default_on_attach(_, bufnr)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "goto definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "list references" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "hover info" })
      -- vim.keymap.set("n", "<leader> ", vim.lsp.buf.code_action, { buffer = bufnr, desc = "code action" })

      if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(true, { bufnr })
      end
    end

    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "lua_ls", "gopls", "ts_ls", "volar",
      },
    })
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = default_on_attach,
    })

    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = function (_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
        default_on_attach(_, bufnr)
      end,
    })

    -- lspconfig.ts_ls.setup({
    --   capabilities = capabilities,
    --   on_attach = default_on_attach,
    --   init_options = {
    --     plugins = {
    --       {
    --         name = "@vue/typescript-plugin",
    --         location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
    --         languages = {"javascript", "typescript", "vue"},
    --       },
    --     },
    --   },
    --   filetypes = {
    --     "javascript",
    --     "typescript",
    --     "vue",
    --   },
    -- })

    lspconfig.volar.setup({
      capabilities = capabilities,
      on_attach = default_on_attach,
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      init_options = {
        vue = {
          hybridMode = false,
        },
      },
    })
  end
}
