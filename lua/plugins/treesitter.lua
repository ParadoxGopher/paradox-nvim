return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({
      ensure_installed = { 'go' },
    })
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        local ok = pcall(vim.treesitter.start)
        if not ok then
          vim.bo.syntax = 'ON' -- fall back to regex syntax
        end
      end,
    })
  end
}
