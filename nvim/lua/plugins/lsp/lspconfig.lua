local function add_ruby_deps_command(client, bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, "ShowRubyDeps", function(opts)
    local params = vim.lsp.util.make_text_document_params()
    local showAll = opts.args == "all"

    client.request("rubyLsp/workspace/dependencies", params, function(error, result)
      if error then
        print("Error showing deps: " .. error)
        return
      end

      local qf_list = {}
      for _, item in ipairs(result) do
        if showAll or item.dependency then
          table.insert(qf_list, {
            text = string.format("%s (%s) - %s", item.name, item.version, item.dependency),
            filename = item.path,
          })
        end
      end

      vim.fn.setqflist(qf_list)
      vim.cmd "copen"
    end, bufnr)
  end, {
    nargs = "?",
    complete = function()
      return { "all" }
    end,
  })
end

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
          -- Lua = {
          --   runtime = { version = "LuaJIT" },
          --   workspace = {
          --     checkThirdParty = false,
          --     library = {
          --       "${3rd}/luv/library",
          --       unpack(vim.api.nvim_get_runtime_file("", true)),
          --     },
          --   },
          -- },
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

    -- mason_lspconfig.setup_handlers {
    -- 	function(server_name)
    -- 		lspconfig[server_name].setup {
    -- 			capabilities = capabilities,
    -- 		}
    -- 	end,
    -- 	["lua_ls"] = function()
    -- 		lspconfig["lua_ls"].setup {
    -- 			capabilities = capabilities,
    -- 			settings = {
    -- 				Lua = {
    -- 					diagnostics = {
    -- 						globals = { "vim" },
    -- 					},
    -- 					completions = {
    -- 						callSnippet = "Replace",
    -- 					},
    -- 				},
    -- 			},
    -- 		}
    -- 	end,
    -- 	["ruby_lsp"] = function()
    -- 		lspconfig["ruby_lsp"].setup {
    -- 			capabilities = capabilities,
    -- 			on_attach = function(client, buffer)
    -- 				add_ruby_deps_command(client, buffer)
    -- 			end,
    -- 		}
    -- 	end,
    -- 	["tailwindcss"] = function()
    -- 		lspconfig["tailwindcss"].setup {}
    -- 	end,
    -- 	-- ["emmet_language_server"] = function()
    -- 	--   lspconfig["emmet_language_server"].setup {
    -- 	--     capabilities = capabilities,
    -- 	--     filetypes = {
    -- 	--       "css",
    -- 	--       "eruby",
    -- 	--       "html",
    -- 	--       "javascript",
    -- 	--       "javascriptreact",
    -- 	--       "typescriptreact",
    -- 	--       "embedded_template",
    -- 	--     },
    -- 	--   }
    -- 	-- end,
    -- }
  end,
}
