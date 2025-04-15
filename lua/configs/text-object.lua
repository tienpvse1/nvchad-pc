require("nvim-treesitter.configs").setup {
  textobjects = {
    select = {
      enable = true,
      keymaps = {

        -- Built-in captures.
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}
