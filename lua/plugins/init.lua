return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = require("configs.dapui_config").dependencies,
    config = require("configs.dapui_config").config,
  },
  {
    "nvim-neotest/neotest",
    dependencies = require("configs.neotest_config").dependencies,
    config = require("configs.neotest_config").config,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = require("configs.devicons").conf,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "nvim-pack/nvim-spectre" },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    cmd = { "Typr", "TyprStats" },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = require("configs.daps").dependencies,
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
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    config = function()
      require "configs.text-object"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = require("configs.telescope_config").dependencies,
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
    dependencies = require("configs.neogit_config").dependencies,
    opts = require("configs.neogit_config").opts,
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
    version = "*",
    event = "VeryLazy",
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
