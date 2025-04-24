local M = {}

M.config = {
  auto_update = true,
  neovim_image_text = "The Gigachad Text Editor🗿",
  main_image = "neovim",
  enable_line_number = true,
  blacklist = {},
  buttons = true,
  file_assets = {},
  show_time = false,

  log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")

  editing_text = function(filename)
    if string.find(filename, ".lua") then
      return "🛠 Đang config Neovim"
    else
      return "💻 Đang code file " .. filename .. " sml"
    end
  end,
  file_explorer_text = "🔭 Soi project bằng Telescope",
  git_commit_text = "Đang push code 💣",
  plugin_manager_text = "Cài plugin",
  reading_text = function(filename)
    if string.find(filename, "zsh") then
      return "💥Cày nát terminal"
    else
      return "👀 Ngó file %s"
    end
  end,
  workspace_text = "Đang ở trong môi trường tự nhiên 🐐",
  line_number_text = "Dòng %s/%s",
}

return M
