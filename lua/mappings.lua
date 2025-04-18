require "nvchad.mappings"
local cmp = require "cmp"
-- add yours herecopilot

local map = vim.keymap.set

-- window resizing
map("n", "<C-Up>", ":resize +2<CR>", { desc = "increase height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "decrease height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "increase width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "increase width" })

-- gitsigns
map("n", "<leader>gb", require("gitsigns").toggle_current_line_blame, { desc = "Toggle blame line" })
map("n", "<leader>gB", require("gitsigns").blame, { desc = "Open Blame" })
-- git diff
map("n", "<leader>gc", "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>")
map("n", "<leader>go", "<cmd>set hidden<cr><cmd>DiffviewOpen<cr><cmd>set nohidden<cr>")

-- nvim-spectre
map("n", "<leader>S", require("spectre").toggle, {
  desc = "Toggle Spectre",
})
map("n", "<leader>sw", function()
  require("spectre").open_visual { select_word = true }
end, {
  desc = "Search current word",
})
map("v", "<leader>sw", require("spectre").open_visual, {
  desc = "Search current word",
})
map("n", "<leader>sp", function()
  require("spectre").open_file_search { select_word = true }
end, {
  desc = "Search on current file",
})

-- nvim-dap
map("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "Add breakpoint at line" })
map("n", "<F5>", require("dap").continue, {
  desc = "Run or continue the debugger",
})
map("n", "<F10>", require("dap").step_over, {
  desc = "Dap Step Over",
})
map("n", "<F11>", require("dap").step_into, {
  desc = "Dap Step Into",
})
map("n", "<S-F11>", require("dap").step_out, {
  desc = "Run or continue the debugger",
})
map("n", "<S-F5>", function()
  require("dap").terminate { all = "true" }
end, {
  desc = "Run or continue the debugger",
})

-- normal mode
map({ "n", "i" }, "<S-A-o>", "<ESC><cmd>TSToolsOrganizeImports<CR>")
map({ "n", "i" }, "<S-A-r>", "<ESC><cmd>TSToolsRemoveUnused<CR>")
map("n", "<leader>i", vim.diagnostic.open_float)

-- telescope
map("n", "<leader>gr", require("telescope.builtin").lsp_references, { noremap = true, silent = true })
map("n", "<leader>gd", require("telescope.builtin").lsp_definitions, { noremap = true, silent = true })
map("n", "<leader>fw", require("telescope").extensions.live_grep_args.live_grep_args)

map("n", "<leader>fc", function()
  require("telescope.builtin").find_files {
    cwd = vim.fn.stdpath "config",
  }
end)

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

map("n", "<leader><leader>m", require("treesj").toggle, { desc = "Toggle split/join" })
map("n", "<leader>fm", function()
  if vim.bo.filetype == "rust" then
    vim.lsp.buf.format()
  else
    require("conform").format()
  end
end)

-- nvim-cmp
map("i", "<C-o>", cmp.mapping.complete)

map("i", "jj", "<ESC>")

-- special config for neovide
map("n", "<C-s>", ":w<CR>") -- Save

vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
