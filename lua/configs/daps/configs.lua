local dap = require "dap"
local dapui = require "dapui"
require("dapui").setup()
require("dap-vscode-js").setup {
  debugger_path = "/home/tienpvse/.local/share/nvim/lazy/vscode-js-debug",
}
require "configs.daps"

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
