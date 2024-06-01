local M = {}

-- Determine whether the current operating system is Windows
-- @return boolean True if the OS is Windows, otherwise false
function M.isWindows()
  return package.config:sub(1, 1) == "\\"
end

-- Determine whether the current operating system is Unix-like
-- @return boolean True if the OS is Unix-like, otherwise false
function M.isUnix()
  return package.config:sub(1, 1) == "/"
end

function M.dependent(specific)
  assert(type(specific), "table", "specific must be a table")

  if M.isWindows() and specific["windows"] then
    return specific["windows"]
  end
  if M.isUnix() and specific["unix"] then
    return specific["unix"]
  end

  return specific[1]
end

return M
