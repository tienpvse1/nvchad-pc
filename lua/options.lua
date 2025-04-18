require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.relativenumber = true

-- require("luasnip/loaders/from_vscode").load()
require("luasnip.loaders.from_vscode").lazy_load { paths = "~/.config/nvim/snippets" }
