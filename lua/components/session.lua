local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function delete_session(opts)
  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = "Delete Current Session",
      finder = finders.new_table {
        results = {
          { "Yes", "#ff0000", true },
          { "No", "#00ff00", false },
        },
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry[1],
            ordinal = entry[1],
          }
        end,
      },

      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          if selection.value[3] then
            vim.cmd "SessionDelete"
          end
        end)
        return true
      end,
    })
    :find()
end

local M = {}

M.delete_session = delete_session

return M
