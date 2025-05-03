local map = vim.keymap.set

map(
  "n",
  "<leader>fw",
  require("telescope").extensions.live_grep_args.live_grep_args,
  { desc = "Telescope grep with args" }
)

map("n", "<leader>fc", function()
  require("telescope.builtin").find_files {
    cwd = vim.fn.stdpath "config",
  }
end, { desc = "Telescope Search in config repo" })
