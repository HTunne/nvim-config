local M = {}

function M.is_git_repo()
  if vim.fn.isdirectory(vim.fn.getcwd() .. '/.git') == 1 then
    return true
  end
  for dir in vim.fs.parents(vim.fn.getcwd()) do
    if vim.fn.isdirectory(dir .. '/.git') == 1 then
      return true
    end
  end
  return false
end

function M.is_plugin_loaded(plugin_name)
  for _, plugin in pairs(require('lazy').plugins()) do
    if plugin[1] == plugin_name then
      if plugin['loaded'] then
        return true
      else
        break
      end
    end
  end
  return false
end

return M
