local M = {}

M.config = function()
  require("codesnap").setup {
    mac_window_bar = true,
    title = "tienpvse",
    watermark = " @tienpvse",
    bg_theme = "grape",
    has_line_number = true,
  }
end

return M
