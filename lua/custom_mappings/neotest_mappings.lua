local map = vim.keymap.set

map("n", "<leader>tr", function()
  require("neotest").run.run()
end, { desc = "Neotest Run test" })

map("n", "<leader>tos", function()
  require("neotest").summary.toggle()
end, { desc = "Neotest Open summary panel" })

map("n", "<leader>top", function()
  require("neotest").output.toggle { enter = true, auto_close = true }
end, { desc = "Neotest Open output panel" })

map("n", "<leader>twr", function()
  require("neotest").run.run { vitestCommand = "vitest --watch" }
end, { desc = "Neotest Run Watch" })

map("n", "<leader>twf", function()
  require("neotest").run.run { vim.fn.expand "%", vitestCommand = "vitest --watch" }
end, { desc = "Neotest Watch File" })
