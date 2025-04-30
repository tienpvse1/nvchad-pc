local M = {}

M.dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }

local opts = {
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

M.config = function()
  local dapui = require "dapui"
  local dap = require "dap"

  dap.listeners.before.attach.dapui_config = dapui.open
  dap.listeners.before.launch.dapui_config = dapui.open
  dap.listeners.before.event_terminated.dapui_config = dapui.close
  dap.listeners.before.event_exited.dapui_config = dapui.close

  dapui.setup(opts)
end

return M
