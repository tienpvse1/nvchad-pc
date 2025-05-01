return {

  {
    "nvim-tree/nvim-web-devicons",
    opts = require("configs.devicons").conf,
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
    "windwp/nvim-ts-autotag",
    config = require("configs.autotag_config").conf,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = require("configs.lspconfig").dependencies,
  },

  -- Lazy loaded plugins
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = require("configs.dapui_config").dependencies,
    config = require("configs.dapui_config").config,
    lazy = true,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    lazy = true,
  },
  {
    "Wansmer/treesj",
    event = "VeryLazy",
    keys = { "<leader>m", "<leader>j", "<leader>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require("configs.noice_config").config,
    dependencies = { "MunifTanjim/nui.nvim", "smjonas/inc-rename.nvim" },
    lazy = true,
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = require("configs.neotest_config").dependencies,
    config = require("configs.neotest_config").config,
    lazy = true,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
  },
  { "nvim-pack/nvim-spectre", lazy = true },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    event = "VeryLazy",
    cmd = { "Typr", "TyprStats" },
    lazy = true,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = require("configs.daps").dependencies,
    event = "VeryLazy",
    config = function()
      require "configs.daps.configs"
    end,
    lazy = true,
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    config = require("configs.codesnap_config").config,
    lazy = true,
  },
}
