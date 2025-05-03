local map = vim.keymap.set

map("n", "<leader>gg", function()
  require("neogit").open { kind = "floating" }
end, { desc = "Git open" })

map("n", "<leader>gs", function()
  require("neogit").open { "stash", kind = "floating" }
end, { desc = "Git open" })

map("n", "<leader>Gd", function()
  if next(require("diffview.lib").views) == nil then
    vim.cmd("DiffviewOpen", {})
  else
    vim.cmd("DiffviewClose", {})
  end
end, { desc = "Git Toggle diffview" })

map("n", "<leader>gc", function()
  if next(require("diffview.lib").views) ~= nil then
    vim.cmd("DiffviewClose", {})
  end
end, { desc = "Close diffview" })

map("n", "<leader>gp", function()
  require("neogit").open { "pull", kind = "floating" }
end, { desc = "Git pull" })

map("n", "<leader>gP", function()
  require("neogit").open { "push", kind = "floating" }
end, { desc = "Git push" })

map("n", "<leader>gw", function()
  require("neogit").open { "worktree", kind = "floating" }
end, { desc = "Git worktree" })

map("n", "<leader>gl", function()
  require("neogit").open { "log", kind = "floating" }
end, { desc = "Git Show log" })

map("n", "<leader>gb", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Git Toggle blame line" })

map("n", "<leader>gB", function()
  require("gitsigns").blame()
end, { desc = "Git Open Blame" })

map("n", "<leader>gh", function()
  require("gitsigns").preview_hunk_inline()
end, { desc = "Git Hunk inline" })

map("n", "<leader>Gf", function()
  vim.cmd { cmd = "DiffviewFileHistory", args = { "%" } }
end, { desc = "Git Hunk floating" })

map("n", "<leader>gq", function()
  require("gitsigns").setqflist()
end, { desc = "Git Hunk floating" })
