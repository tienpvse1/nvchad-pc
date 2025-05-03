local M = {}

M.config = function()
  local actions = require "diffview.actions"
  require("diffview").setup {
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
    keymaps = {
      view = {
        { "n", "q", actions.close, { desc = "Git Close diffview" } },
      },
      diff1 = {
        { "n", "q", actions.close, { desc = "Git Close diffview" } },
      },
      diff2 = {
        { "n", "q", actions.close, { desc = "Git Close diffview" } },
      },
      diff3 = {
        { "n", "q", actions.close, { desc = "Git Close diffview" } },
      },
      diff4 = {
        { "n", "q", actions.close, { desc = "Git Close diffview" } },
      },
      file_panel = {
        { "n", "q", actions.close, { desc = "Git Close diffview" } },
      },
      file_history_panel = {
        { "n", "q", actions.close, { desc = "Git Close diffview" } },
      },
    },
  }
end

return M
