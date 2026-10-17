return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = true,
      update_in_insert = false,
      always_visible = true,
      cond = function()
        return vim.bo.filetype ~= "markdown"
      end,
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " },
    }

    local mode = {
      "mode",
      fmt = function(str)
        return "-- " .. str .. " --"
      end,
    }

    local jj = require("statusline.jj")

    local branch = {
      "branch",
      icon = "",
      cond = function()
        return not jj.in_jj_repo()
      end
    }

    local progress = function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "", "", "" } --adding more chars will still work
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index] .. " " .. math.floor(line_ratio * 100) .. "%%"
    end

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard", "NvimTree" } },
      },
      sections = {
        lualine_a = {
          branch,
          { jj.status, cond = jj.in_jj_repo },
        },
        lualine_b = { mode },
        lualine_c = { diagnostics },
        lualine_x = { diff, "filetype" },
        lualine_y = { "location" },
        lualine_z = { progress },
      },
      extensions = { "nvim-tree", "lazy" },
    }

    return opts
  end,
}
