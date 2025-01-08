return {
  -- {
  --   "tpope/vim-fugitive",
  --   config = function ()
  --   end
  -- },
  {
    "akinsho/git-conflict.nvim",
    version = "v2.1.0",
    config = function()
      require("git-conflict").setup({
        default_mappings = false,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "GitConflictDetected",
        callback = function ()
          if require("git-conflict").conflict_count() > 0 then
            vim.keymap.set("n", "<leader>co", "<Plug>(git-conflict-ours)", { desc = "choose ours", buffer = true })
            vim.keymap.set("n", "<leader>ct", "<Plug>(git-conflict-theirs)", { desc = "choose theirs", buffer = true })
            vim.keymap.set("n", "<leader>cb", "<Plug>(git-conflict-both)", { desc = "choose both", buffer = true })

            vim.keymap.set("n", "<leader>cn", "<Plug>(git-conflict-next-conflict)", { desc = "next conflict", buffer = true })
            vim.keymap.set("n", "<leader>cp", "<Plug>(git-conflict-prev-conflict)", { desc = "prev conflict", buffer = true })

            vim.keymap.set("n", "<leader>cq", "<cmd>GitConflictListQf<cr>", { desc = "open list of conflicts", buffer = true })
          end
        end
      })
    end,
  }
}
