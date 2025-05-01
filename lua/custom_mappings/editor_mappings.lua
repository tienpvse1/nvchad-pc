local map = vim.keymap.set
-- window resizing
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Window increase height" })

map("n", "<C-Down>", ":resize -2<CR>", { desc = "Window decrease height" })

map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Window increase width" })

map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Window increase width" })

map("n", "<S-i>", vim.diagnostic.open_float, { desc = "Editor Open diagnostic floating window" })

map("n", "<C-s>", function()
  vim.api.nvim_command "write"
end, { desc = "Editor Save file" })

map("n", "<leader>fm", require("conform").format, { desc = "Editor Format document" })

map("i", "jj", "<ESC>", { desc = "Editor Escape insert mode" })

map("n", "<leader>v", vim.cmd.vsplit, { desc = "Editor Split current pane vertically" })

map("n", "<leader>nv", vim.cmd.vnew, { desc = "Editor Split new vertical pane" })

map("n", "<leader>nh", vim.cmd.new, { desc = "Editor Split new horizontal pane" })

map("n", "<leader>h", vim.cmd.split, { desc = "Editor Split current pane horizontally" })

map("v", "<leader>cc", function()
  require("codesnap").copy_into_clipboard(require("codesnap").copy_into_clipboard)
end, { desc = "Editor Screenshot your code" })

map("n", "<A-j>", "<cmd>cnext<CR>", { desc = "Quickfix Next item" })

map("n", "<A-k>", "<cmd>cprevious<CR>", { desc = "Quickfix Previous item" })

map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Quickfix Open" })

map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Quickfix Close" })

map("n", "<leader><leader>m", require("treesj").toggle, { desc = "Toggle split/join" })
