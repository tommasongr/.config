return {
  "stevearc/oil.nvim",
  dependencies = {
    "refractalize/oil-git-status.nvim",
  },
  config = function()
    local oil = require "oil"
    local oil_git_status = require "oil-git-status"

    oil.setup {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      columns = {},
      win_options = {
        signcolumn = "yes:2",
        wrap = true,
      },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
				["<C-h>"] = false,
				["<M-h>"] = "actions.select_split",
				["<C-l>"] = false,
				["<M-l>"] = "actions.select_split",
				["<C-s>"] = false,
				["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
				["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns { "icon", "permissions", "size", "mtime" }
            else
              require("oil").set_columns { "icon" }
            end
          end,
        },
      },
    }

    oil_git_status.setup()

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
