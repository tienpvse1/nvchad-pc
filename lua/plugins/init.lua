return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require "configs.nonels_config"
    end,
  },
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
      graph_style = "kitty",
      mappings = require("configs.neogit_config").mappings,
      use_default_keymaps = require("configs.neogit_config").use_default_keymaps,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
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
    config = require("configs.autotag_config").conf,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = require("configs.lspconfig").dependencies,
  },
}
