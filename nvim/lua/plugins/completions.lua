return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        -- Build Step is needed for regex support in snippets
        -- This step is not supported in many windows environments
        -- Remove the below condition to re-enable on windows
        if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load { paths = "./snippets/languages" }
        require("luasnip.loaders.from_vscode").lazy_load { paths = "./snippets/frameworks" }
      end,
    },
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      completion = { completeopt = "menu,menuone,preview,noinsert" },
      mapping = cmp.mapping.preset.insert {
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
        ["<C-e>"] = cmp.mapping.abort(), -- Hide suggestions
        ["<C-y>"] = cmp.mapping.confirm { select = true }, -- Accept suggestion
        ["<C-Space>"] = cmp.mapping.complete {}, -- Show suggestions
        ["<C-l>"] = cmp.mapping(function() -- Go to next insertion point
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function() -- Go to previous insertion point
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      },
    }
  end,
}
