require "nvchad.mappings"
local cmp = require "cmp"
-- add yours herecopilot

local map = vim.keymap.set

-- nvim-spectre
map('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

-- normal mode
map({ "n", "i" }, "<C-Z>", "<C-O>u")
map({ "n", "i" }, "<S-A-o>", "<ESC><cmd>TSToolsOrganizeImports<CR>")
map({ "n", "i" }, "<S-A-r>", "<ESC><cmd>TSToolsRemoveUnused<CR>")
map("n", "<leader>i", function()
  vim.diagnostic.open_float()
end)
map("n", "<leader>gc", "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>")
map("n", "<leader>go", "<cmd>set hidden<cr><cmd>DiffviewOpen<cr><cmd>set nohidden<cr>")
map("n", "<leader>i", function()
  vim.diagnostic.open_float()
end)

map("n", "<C-/>", function()
  require("Comment.api").toggle.linewise.current()
end)

map("n", "<leader>gr", function()
  require("telescope.builtin").lsp_references()
end, { noremap = true, silent = true })

map("n", "<leader>gd", function()
  require("telescope.builtin").lsp_definitions()
end, { noremap = true, silent = true })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTerm",
    size = 0.8,
    float_opts = {
      relative = "editor",
      row = 0.05,
      col = 0.05,
      width = 0.9,
      height = 0.8,
    },
  }
end, { desc = "Terminal Toggle Floating term" })

map("n", "<leader><leader>m", function()
  require("treesj").toggle()
end)
map("n", "<leader>db", "<cmd>DBUIToggle<CR>")
map("n", "<leader>fm", function()
  if vim.bo.filetype == "rust" then
    vim.lsp.buf.format()
  else
    require("conform").format()
  end
end)

-- override telescope live grep with live grep args
map("n", "<leader>fw", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- insert mode
map("i", "<C-o>", function()
  cmp.mapping.complete()
end)

map("i", "jj", "<ESC>")
-- visual mode
map("v", "<C-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- terminal mode

-- command mode

-- special config for neovide
map("n", "<C-s>", ":w<CR>")            -- Save
map("v", "<C-c>", '"+y')               -- Copy
map("n", "<C-v>", '"+P')               -- Paste normal mode
map("v", "<C-v>", '"+P')               -- Paste visual mode
map("c", "<C-v>", "<C-R>+")            -- Paste command mode
map("c", "<C-S-v>", "<C-R>+")          -- Paste command mode
map("i", "<C-v>", '<ESC>l"+Pli')       -- Paste insert mode
map("t", "<C-S-v>", '<C-\\><C-n>"*pa') -- Paste command mode

vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
