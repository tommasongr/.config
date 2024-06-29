return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require "oil"

    oil.setup {
      default_file_explorer = true,
      columns = {
        "icon",
      },
      win_options = {
        signcolumn = "yes",
      },
      view_options = {
        show_hidden = true,
      },
    }

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
