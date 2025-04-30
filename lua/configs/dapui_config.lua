local M = {}

M.dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }

M.opts = {
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.25,
        },
        {
          id = "breakpoints",
          size = 0.25,
        },
        {
          id = "stacks",
          size = 0.25,
        },
        {
          id = "watches",
          size = 0.25,
        },
      },
      position = "left",
      size = 40,
    },
    {
      elements = {
        {
          id = "console",
          size = 1,
        },
      },
      position = "bottom",
      size = 15,
    },
  },
}

return M
