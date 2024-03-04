return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        eruby = { "htmlbeautifier" },
        markdown = { "prettier" },
        ruby = { "rubocop" },
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
      },
    }

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format {
        lsp_fallback = true,
        async = false,
      }
    end, { desc = "[F]ormat" })
  end,
}
