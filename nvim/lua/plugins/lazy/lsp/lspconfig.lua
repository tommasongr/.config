return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(event)
        local opts = { buffer = event.buffer, silent = true }

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

        opts.desc = "Show documentation"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

    local servers = {
			html = {
				filetypes = { "html", "templ", "eruby", "embedded_template" }
			},

      tailwindcss = {
        settings = {
          tailwindCSS = {
            includeLanguages = {},
            experimental = {
              classRegex = {
                "(?:class: ?)(?:'|\"|`)([^\"'`]*)(?:'|\"|`)",
                "data-.*-class=['\"]([^'\"]*)",
                "classList.(?:add|remove)\\(([^)]*)\\)",
                "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)",
              },
            },
          },
        },
      },

      emmet_language_server = {},

      lua_ls = {
        settings = {
          diagnostics = {
            globals = { "vim" },
          },
          completions = {
            callSnippet = "Replace",
          },
        },
      },
      -- solargraph = {},
    }

    require("mason-lspconfig").setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          require("lspconfig")[server_name].setup {
            cmd = server.cmd,
            settings = server.settings,
            filetypes = server.filetypes,
            capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
          }
        end,
      },
    }
  end,
}
