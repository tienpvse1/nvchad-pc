return {

  {
    "nvim-tree/nvim-web-devicons",
    opts = require("configs.devicons").conf,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  { "nvim-pack/nvim-spectre" },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "igorlfs/nvim-dap-view",
      "theHamsta/nvim-dap-virtual-text",
      "mxsdev/nvim-dap-vscode-js",
      "microsoft/vscode-js-debug",
    },
    config = function()
      require "configs.daps.configs"
    end,
  },
  {
    "rmagatti/auto-session",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    config = function()
      require("auto-session").setup {
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      require "configs.text-object"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = require("configs.telescope_config").conf,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform_config"
    end,
  },
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      mappings = require("configs.neogit_config").mappings,
      use_default_keymaps = require("configs.neogit_config").use_default_keymaps,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("typescript-tools").setup {}
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    dependencies = {
      {
        "pmizio/typescript-tools.nvim",
        dependencies = "nvim-lua/plenary.nvim",

        opts = {
          settings = {
            tsserver_file_preferences = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayFunctionLikeReturnTypeHints = true,
            },
          },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp_config",
  },
  {
    "williamboman/mason.nvim",
    opts = require("configs.mason").config,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.treesitter").config,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require("configs.noice_config").config,
    dependencies = { "MunifTanjim/nui.nvim", "smjonas/inc-rename.nvim" },
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },

  {
    "andweeb/presence.nvim",
    event = "BufEnter",
    opts = require("configs.presence").config,
  },

  {
    "Wansmer/treesj",
    keys = { "<leader>m", "<leader>j", "<leader>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {
        event = "BufReadPre",
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
      },
    },
  },
}
