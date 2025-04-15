local dap = require "dap"

dap.adapters["pwa-chrome"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
      skilpFiles = { "<node_internals>/**" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch NestJS app",
      cwd = "${workspaceFolder}",
      runtimeArgs = { "start:debug" },
      program = "${file}",
      runtimeExecutable = "pnpm",
      sourceMaps = true,
      protocol = "inspector",
      outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
      skilpFiles = { "<node_internals>/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Svelte server \n",
      cwd = "${workspaceFolder}",
      runtimeArgs = { "dev" },
      runtimeExecutable = "pnpm",
      protocol = "inspector",
      console = "integratedTerminal",
      sourceMaps = true,
      skilpFiles = { "<node_internals>/**" },
    },
  }
end

local function getUrl()
  local url = vim.fn.input("Host URL: ", "http://localhost:")
  return url
end

for _, lang in ipairs { "javascriptreact", "typescriptreact", "svelte" } do
  dap.configurations[lang] = {
    {
      name = "Attach Chrome",
      type = "pwa-chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
      skilpFiles = { "<node_internals>/**" },
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Debug with Chrome",
      url = getUrl,
      webRoot = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      skilpFiles = { "<node_internals>/**" },
      sourceMaps = true,
      ["debug.javascript.terminalOptions"] = {
        ["skipFiles"] = { "<node_internals>/**" },
      },
    },
  }
end
