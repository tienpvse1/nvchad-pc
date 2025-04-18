local M = {}

local function telescope_conf(_, conf)
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

return M
