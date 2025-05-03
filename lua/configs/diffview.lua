local M = {}

M.config = function()
  require("diffview").setup {
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
  }
end

return M
