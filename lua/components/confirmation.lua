local Menu = require "nui.menu"

local menu = Menu({
  position = "50%",
  size = {
    width = 25,
    height = 5,
  },
  border = {
    style = "single",
    text = {
      top = "[Delete Session]",
      top_align = "center",
    },
  },
  win_options = {},
}, {
  lines = {
    Menu.item("Yes (Y)", { value = true }),
    Menu.item("No (N)", { value = false }),
  },
  max_width = 20,
  keymap = {
    focus_next = { "j", "<Down>", "<Tab>" },
    focus_prev = { "k", "<Up>", "<S-Tab>" },
    close = { "<Esc>", "<C-c>" },
    submit = { "<CR>", "<Space>" },
  },
  on_close = function()
    print "Menu Closed!"
  end,
  on_submit = function(item)
    if item.value then
      vim.cmd "SessionDelete"
    end
  end,
})

local M = {}

M.displayMenu = function()
  menu:mount()
end
return M
