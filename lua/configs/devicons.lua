local M = {}

local function override_icons(_, conf)
  conf.override_by_filename = {
    [".graphqlrc"] = {
      icon = "󰡷",
      color = "#e535ab",
      name = "graphql",
    },
    [".graphqlrc.json"] = {
      icon = "󰡷",
      color = "#e535ab",
      name = "graphql",
    },
  }
  conf.override_by_extension = {
    ["graphql"] = {
      icon = "󰡷",
      color = "#e535ab",
      name = "graphql",
    },

    ["gql"] = {
      icon = "󰡷",
      color = "#e535ab",
      name = "graphql",
    },
  }
  return conf
end

M.conf = override_icons

return M
