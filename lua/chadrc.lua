-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula-evondev",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.term = {
  float = {
    relative = "editor",
    row = 0.05,
    col = 0.05,
    width = 0.9,
    height = 0.8,
  },
}

-- M.nvdash = {
--   load_on_startup = false,
-- }

M.lsp = {
  signature = true,
}

M.ui = {
  statusline = {
    theme = "default",
    modules = {},
  },
  cmp = {
    icons_left = true,
  },
  tabufline = {},
  telescope = {
    style = "borderless",
  },
}

-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
