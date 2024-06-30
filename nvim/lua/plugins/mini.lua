return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.statusline").setup {
        use_icons = false,
      }
      require("mini.move").setup()
    end,
  },

  {
    "echasnovski/mini.ai",
    event = { "BufReadPre", "BufNewFile" },
    opts = { n_lines = 500 },
  },

  {
    "echasnovski/mini.comment",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      options = {
        custom_commentstring = function()
          local ts_context_commentstring = require "ts_context_commentstring.internal"
          return ts_context_commentstring.calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },

  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>up",
        function()
          local Util = require "lazy.core.util"
          vim.g.minipairs_disable = not vim.g.minipairs_disable
          if vim.g.minipairs_disable then
            Util.warn("Disabled auto pairs", { title = "Option" })
          else
            Util.info("Enabled auto pairs", { title = "Option" })
          end
        end,
        desc = "Toggle auto pairs",
      },
    },
  },

  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
			-- stylua: ignore
			{ "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
}
