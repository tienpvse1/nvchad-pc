local map = vim.keymap.set
local cmp = require "cmp"

local function svelte_organize_import()
  vim.lsp.buf.code_action { context = { only = { "source.organizeImports" }, diagnostics = {} }, apply = true }
end

local function typescript_organize_import()
  local client = vim.lsp.get_clients({ name = "ts_ls", bufnr = 0 })[1]
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  client:exec_cmd(params, {})
end

local function organize_import()
  local ft = vim.bo.filetype
  if ft == "svelte" then
    svelte_organize_import()
  end

  if ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
    typescript_organize_import()
  end
end

map("n", "<S-A-o>", organize_import, { desc = "LSP Organize import" })

map("n", "<space>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code actions", noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() })

map("i", "<C-o>", cmp.mapping.complete, {
  desc = "LSP Trigger auto complete",
})
