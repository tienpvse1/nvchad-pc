require "nvchad.mappings"
local cmp = require "cmp"

local map = vim.keymap.set

-- dapview.nvim
map("n", "<F1>", function()
  require("dap-view").jump_to_view "watches"
end, { desc = "Dapview focus watches" })

map("n", "<F2>", function()
  require("dap-view").jump_to_view "scopes"
end, { desc = "Dapview focus scopes" })

map("n", "<F3>", function()
  require("dap-view").jump_to_view "exceptions"
end, { desc = "Dapview focus exceptions" })

map("n", "<F4>", function()
  require("dap-view").jump_to_view "breakpoints"
end, { desc = "Dapview focus breakpoints" })

-- window resizing
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Window increase height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Window decrease height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Window increase width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Window increase width" })

-- gitsigns
map("n", "<leader>gb", require("gitsigns").toggle_current_line_blame, { desc = "Git Toggle blame line" })
map("n", "<leader>gB", require("gitsigns").blame, { desc = "Git Open Blame" })

-- git diff

-- neogit
--
map("n", "<leader>Gg", function()
  require("neogit").open { kind = "floating" }
end, { desc = "Git open" })

map("n", "<leader>Gd", function()
  require("neogit").open { "diff", kind = "floating" }
end, { desc = "Git open diffview" })

map("n", "<leader>Gc", function()
  require("neogit").open { "commit", kind = "floating" }
end, { desc = "Git open commit" })

map("n", "<leader>Gc", function()
  require("neogit").open { "commit", kind = "floating" }
end, { desc = "Git open commit" })

map("n", "<leader>Gp", function()
  require("neogit").open { "pull", kind = "floating" }
end, { desc = "Git pull" })

map("n", "<leader>GP", function()
  require("neogit").open { "push", kind = "floating" }
end, { desc = "Git push" })

map("n", "<leader>Gw", function()
  require("neogit").open { "worktree", kind = "floating" }
end, { desc = "Git worktree" })

-- nvim-spectre
map("n", "<leader>st", require("spectre").toggle, {
  desc = "Spectre totgle",
})
map("n", "<leader>sw", function()
  require("spectre").open_visual { select_word = true }
end, {
  desc = "Spectre Search current word",
})
map("v", "<leader>sw", require("spectre").open_visual, {
  desc = "Spectre current visualized",
})
map("n", "<leader>sp", function()
  require("spectre").open_file_search { select_word = true }
end, {
  desc = "Spectre Search on current file",
})

-- nvim-dap
map("n", "<leader>db", function()
  local condition = vim.fn.input("Breakpoint condition ", "true")
  require("dap").toggle_breakpoint(condition)
end, { desc = "DAP add breakpoint at line" })
map("n", "<F8>", require("dap").toggle_breakpoint, { desc = "DAP add conditional breakpoint at line" })
map("n", "<F5>", require("dap").continue, {
  desc = "DAP run or continue the debugger",
})
map("n", "<F10>", require("dap").step_over, {
  desc = "DAP step Over",
})
map("n", "<F11>", require("dap").step_into, {
  desc = "DAP step Into",
})
map("n", "<S-F11>", require("dap").step_out, {
  desc = "DAP step out",
})
map("n", "<S-F5>", function()
  require("dap").terminate { all = "true" }
end, {
  desc = "DAP terminate session",
})

-- normal mode
map({ "n", "i" }, "<S-A-o>", "<ESC><cmd>TSToolsOrganizeImports<CR>")
map({ "n", "i" }, "<S-A-r>", "<ESC><cmd>TSToolsRemoveUnused<CR>")
map("n", "<leader>i", vim.diagnostic.open_float)

-- telescope
map(
  "n",
  "<leader>gr",
  require("telescope.builtin").lsp_references,
  { desc = "Telescope go to references", noremap = true, silent = true }
)
map(
  "n",
  "<leader>gd",
  require("telescope.builtin").lsp_definitions,
  { desc = "Telescope go to definitions", noremap = true, silent = true }
)
map(
  "n",
  "<leader>fw",
  require("telescope").extensions.live_grep_args.live_grep_args,
  { desc = "Telescope grep with args" }
)

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
