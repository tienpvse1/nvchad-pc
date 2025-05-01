local map = vim.keymap.set

map("n", "<leader>dt", function()
  require("dapui").toggle()
end, { desc = "DAP Toggle UI" })

map("n", "<leader>de", function()
  require("dapui").eval()
end, { desc = "DAP Evaluate variable" })
