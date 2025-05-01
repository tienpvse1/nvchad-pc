local M = {}

M.dependencies = {
  "nvim-neotest/nvim-nio",
  "nvim-lua/plenary.nvim",
  "antoinemadec/FixCursorHold.nvim",
  "nvim-treesitter/nvim-treesitter",
  { "marilari88/neotest-vitest", event = "VeryLazy", lazy = true },
  { "thenbe/neotest-playwright", lazy = true },
}

M.config = function()
  require("neotest").setup {
    adapters = {
      require "neotest-vitest" {
        filter_dir = function(name, relpath)
          return name ~= "node_modules" and not string.match(relpath, "e2e")
        end,
      },
      require("neotest-playwright").adapter {
        options = {
          persist_project_selection = true,
          enable_dynamic_test_discovery = true,
          is_test_file = function(file_path)
            local result = file_path:find "e2e/.*%.test%.ts$" ~= nil
            return result
          end,
        },
      },
    },
  }
end

return M
