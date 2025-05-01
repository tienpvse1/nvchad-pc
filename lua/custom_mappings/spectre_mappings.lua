local map = vim.keymap.set

map("n", "<leader>st", function()
  require("spectre").toggle()
end, {
  desc = "Spectre totgle",
})

map("n", "<leader>sw", function()
  require("spectre").open_visual { select_word = true }
end, {
  desc = "Spectre Search current word",
})

map("v", "<leader>sw", function()
  require("spectre").open_visual()
end, {
  desc = "Spectre current visualized",
})

map("n", "<leader>sp", function()
  require("spectre").open_file_search { select_word = true }
end, {
  desc = "Spectre Search on current file",
})
