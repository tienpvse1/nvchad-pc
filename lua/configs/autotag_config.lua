local M = {}
local function conf()
  require("nvim-ts-autotag").setup {
    event = "BufReadPre",
    opts = {
      enable_close = true, -- Auto close tags
      enable_rename = true, -- Auto rename pairs of tags
      enable_close_on_slash = true, -- Auto close on trailing </
    },
  }
end

M.conf = conf

return M
