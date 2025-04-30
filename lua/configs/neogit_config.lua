local M = {}

local mappings = {
  status = {
    ["a"] = "Stage",
  },
}


M.dependencies = {
  "nvim-lua/plenary.nvim",
  "sindrets/diffview.nvim",
  "nvim-telescope/telescope.nvim",
}

M.opts = {

  graph_style = "kitty",
  mappings = mappings,
  use_default_keymaps = true,
}

return M
