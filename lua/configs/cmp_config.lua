local opts = require "nvchad.configs.cmp"
local cmp = require "cmp"

opts.mapping["<C-o>"] = cmp.mapping.complete()
table.insert(opts.sources, { name = "crates" })

dofile(vim.g.base46_cache .. "cmp")

return opts
