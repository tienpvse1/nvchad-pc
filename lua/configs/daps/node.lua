local dap = require "dap"

local function getCwd()
  local cwd = vim.fn.input("Current Directory ", vim.fn.getcwd())
  return cwd
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
      name = "Launch JS app",
      cwd = getCwd,
      runtimeArgs = { "start" },
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
      cwd = getCwd,
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
      skipFiles = {
        "<node_internals>/**/*.js",
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
      ["debug.javascript.terminalOptions"] = {
        ["skipFiles"] = { "<node_internals>/**" },
      },
    },
  }
end
