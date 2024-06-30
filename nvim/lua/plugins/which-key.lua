return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "Go to" },
      ["]"] = { name = "Next" },
      ["["] = { name = "Prev" },
      ["<leader>b"] = { name = "Buffer" },
      ["<leader>c"] = { name = "Code" },
      ["<leader>t"] = { name = "Tabs", _ = "which_key_ignore" },
      ["<leader>s"] = { name = "Search" },
      ["<leader>p"] = { name = "Pane" },
      ["<leader>u"] = { name = "UI" },
      ["<leader>w"] = { name = "Workspace", _ = "which_key_ignore" },
    },
  },
  config = function(_, opts)
    local which_key = require "which-key"

    which_key.setup(opts)
    which_key.register(opts.defaults)
  end,
}
