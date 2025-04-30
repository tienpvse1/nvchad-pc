local M = {}

local function telescope_conf(_, conf)
  conf.extensions["ui-select"] = {
    require("telescope.themes").get_dropdown {},
  }
  require("telescope").load_extension "ui-select"

  conf.pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        n = {
          ["<C-d>"] = "delete_buffer",
        },
      },
    },
  }

  return conf
end

M.conf = telescope_conf
M.dependencies = {
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    version = "^1.0.0",
  },
  "nvim-telescope/telescope-ui-select.nvim",
}

return M
