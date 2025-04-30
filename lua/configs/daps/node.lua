local dap = require "dap"

local function getLaunchCmd()
  local cmd = vim.fn.input("npm script", "dev")
  return { cmd }
end

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
      name = "Launch with command",
      cwd = "${workspaceFolder}",
      runtimeArgs = getLaunchCmd,
      program = "${file}",
      runtimeExecutable = "pnpm",
      sourceMaps = true,
      protocol = "inspector",
      outFiles = { "${workspaceFolder}/**/*", "!**/node_modules/**" },
      skipFiles = {
        "<node_internals>/**/*.js",
      },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
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
      outFiles = { "${workspaceFolder}/**/*", "!**/node_modules/**" },
      console = "integratedTerminal",
      skipFiles = {
        "<node_internals>/**/*.js",
      },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
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
      skipFiles = {
        "<node_internals>/**/*.js",
      },
      sourceMaps = true,
    },
  }
end
