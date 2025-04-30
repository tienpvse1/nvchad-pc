require("nvim-dap-virtual-text").setup()

require("dap-vscode-js").setup {
  debugger_path = "/home/tienpvse/.local/share/nvim/lazy/vscode-js-debug",
}

require "configs.daps.node"
