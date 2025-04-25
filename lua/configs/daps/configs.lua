local dap = require "dap"
local dv = require "dap-view"
require("nvim-dap-virtual-text").setup()

dap.listeners.before.attach["dap-view-config"] = dv.open
dap.listeners.before.launch["dap-view-config"] = dv.open

dap.listeners.before.event_terminated["dap-view-config"] = dv.close
dap.listeners.before.event_exited["dap-view-config"] = dv.close

require("dap-vscode-js").setup {
  debugger_path = "/home/tienpvse/.local/share/nvim/lazy/vscode-js-debug",
}
require "configs.daps"
