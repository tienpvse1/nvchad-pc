local map = vim.keymap.set

map("n", "<leader>gg", function()
  require("neogit").open { kind = "floating" }
end, { desc = "Git open" })

map("n", "<leader>Gd", function()
  if next(require("diffview.lib").views) == nil then
    vim.cmd("DiffviewOpen", {})
  else
    vim.cmd("DiffviewClose", {})
  end
end, { desc = "Git Toggle diffview" })

map("n", "<leader>gc", function()
  require("neogit").open { "commit", kind = "floating" }
end, { desc = "Git open commit" })

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
