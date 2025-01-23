return {
  "danymat/neogen",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local neogen = require "neogen"

    neogen.setup {
      snippet_engine = "luasnip",
    }

    vim.keymap.set("n", "<leader>cd", neogen.generate, { desc = "Generate documentation" })
  end,
}
