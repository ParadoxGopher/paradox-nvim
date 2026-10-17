local M = {}

local function jj_run(cmd)
  local result = vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then return nil end
  return result:gsub("%s+$", "")
end

local _cache = {}
function M.in_jj_repo()
  local dir = vim.fn.expand("%:p:h")
  if _cache[dir] == nil then
    vim.fn.system("jj-starship detect")
    _cache[dir] = vim.v.shell_error == 0
  end
  return _cache[dir]
end

function M.status()
  if not M.in_jj_repo() then return "" end

  local info = jj_run(
    "jj-starship --no-color"
  )


  local parts = {}
  if info and info ~= "" then table.insert(parts, info) end

  return table.concat(parts, "  ")
end

return M
