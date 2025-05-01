require "nvchad.mappings"
local cmp = require "cmp"

local map = vim.keymap.set

-- navbuddy
map("n", "<leader>nb", function()
  require("nvim-navbuddy").open(vim.api.nvim_get_current_buf())
end, { desc = "NavBuddy open" })

-- neotest
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

-- window resizing
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Window increase height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Window decrease height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Window increase width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Window increase width" })

-- gitsigns
map("n", "<leader>gb", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Git Toggle blame line" })
map("n", "<leader>gB", function()
  require("gitsigns").blame()
end, { desc = "Git Open Blame" })

-- LSP code actions
map("n", "<space>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code actions", noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() })

-- neogit
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

-- nvim-spectre
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

-- dapui
map("n", "<leader>dt", function()
  require("dapui").toggle()
end, { desc = "DAP Toggle UI" })
map("n", "<leader>de", function()
  require("dapui").eval()
end, { desc = "DAP Evaluate variable" })

-- nvim-dap
map("n", "<leader>db", function()
  local condition = vim.fn.input("Breakpoint condition ", "true")
  require("dap").toggle_breakpoint(condition)
end, { desc = "DAP Add breakpoint at line" })
map("n", "<F8>", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP add conditional breakpoint at line" })
map("n", "<F5>", function()
  require("dap").continue()
end, {
  desc = "DAP Run or continue the debugger",
})
map("n", "<F10>", function()
  require("dap").step_over()
end, {
  desc = "DAP Step Over",
})
map("n", "<F11>", function()
  require("dap").step_into()
end, {
  desc = "DAP Step Into",
})
map("n", "<S-F11>", function()
  require("dap").step_out()
end, {
  desc = "DAP Step out",
})
map("n", "<S-F5>", function()
  require("dap").terminate { all = "true" }
end, {
  desc = "DAP Terminate session",
})

-- Common stuffs
map("n", "<S-i>", vim.diagnostic.open_float, { desc = "Editor Open diagnostic floating window" })
map("n", "<C-s>", ":w<CR>", { desc = "Editor Save file" })
map("n", "<leader>fm", require("conform").format, { desc = "Editor Format document" })
map("i", "jj", "<ESC>", { desc = "Editor Escape insert mode" })
map("n", "<leader>v", vim.cmd.vsplit, { desc = "Editor Split current pane vertically" })
map("n", "<leader>nv", vim.cmd.vnew, { desc = "Editor Split new vertical pane" })
map("n", "<leader>nh", vim.cmd.new, { desc = "Editor Split new horizontal pane" })
map("n", "<leader>h", vim.cmd.split, { desc = "Editor Split current pane horizontally" })

-- Telescope
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
end, { desc = "Telescope Search in config repo" })

map("n", "<leader><leader>m", require("treesj").toggle, { desc = "Toggle split/join" })

-- nvim-cmp
map("i", "<C-o>", cmp.mapping.complete, {
  desc = "LSP Trigger auto complete",
})

map("n", "<leader>ds", function()
  local dropdown_theme = require("telescope.themes").get_dropdown {}
  require("components.session").delete_session(dropdown_theme)
end, { desc = "Testing Delete session" })

-- quickfix
map("n", "<A-j>", "<cmd>cnext<CR>", { desc = "Quickfix Next item" })
map("n", "<A-k>", "<cmd>cprevious<CR>", { desc = "Quickfix Previous item" })
map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Quickfix Open" })
map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Quickfix Close" })

-- codesnap
map("v", "<leader>cc", function()
  require("codesnap").copy_into_clipboard(require("codesnap").copy_into_clipboard)
end, { desc = "Editor Screenshot your code" })
