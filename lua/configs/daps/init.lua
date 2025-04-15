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
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
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
      skipFiles = { "<node_internals>/**", "node_modules/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Svelte server",
      cwd = "${workspaceFolder}",
      runtimeArgs = { "dev" },
      runtimeExecutable = "pnpm",
      protocol = "inspector",
      console = "integratedTerminal",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**", "node_modules/**" },
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
      skipFiles = {
        "<node_internals>/**",
        "node_modules/**",
        "${workspaceRoot}/node_modules/**/*.js",
        "<node_internals>/**/*.js",
      },
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Debug with Chrome",
      url = getUrl,
      webRoot = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      skipFiles = {
        "<node_internals>/**/*.js",
        "<node_modules>/**/*.js",
        "${workspaceRoot}/node_modules/**/*.js",
      },
      sourceMaps = true,
      ["debug.javascript.terminalOptions"] = {
        ["skipFiles"] = { "<node_internals>/**" },
      },
    },
  }
end
