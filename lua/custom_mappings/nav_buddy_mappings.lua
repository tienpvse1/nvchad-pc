local map = vim.keymap.set

map("n", "<leader>nb", function()
  require("nvim-navbuddy").open(vim.api.nvim_get_current_buf())
end, { desc = "NavBuddy open" })
