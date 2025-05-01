local M = {}

--- @param table table<string>
--- @param value string
local function is_exists_in_table(table, value)
  for _, curr in ipairs(table) do
    if curr == value then
      return true
    end
  end
  return false
end

M.is_exists_in_table = is_exists_in_table

return M
