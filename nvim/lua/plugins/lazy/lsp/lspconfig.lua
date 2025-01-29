return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		{ "williamboman/mason-lspconfig.nvim", config = function() end },
	},
	opts = {
		ensure_installed = {
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"lua_ls",
			"emmet_language_server",
			-- "ruby_lsp",
		},
		servers = {
			html = {
				filetypes = { "html", "templ", "eruby", "embedded_template" },
			},

			sourcekit = {
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
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
				Lua = {
					settings = {
						diagnostics = {
							globals = { "vim" },
						},
						completions = {
							callSnippet = "Replace",
						},
					},
				},
			},
		},
	},
	config = function(_, opts)
		-- local mason_lspconfig = require "mason-lspconfig"
		-- local cmp_nvim_lsp = require "cmp_nvim_lsp"

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(event)
				local options = { buffer = event.buffer, silent = true }

				options.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)

				options.desc = "Show LSP references"
				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", options)

				options.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", options)

				options.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options)

				options.desc = "Smart rename"
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, options)

				options.desc = "Show documentation"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
			end,
		})

		local servers = opts.servers
		local capabilities =
			 vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(),
				 require("blink.cmp").get_lsp_capabilities(), opts.capabilities or {})

		local function setup(server)
			local server_opts = servers[server] or {}
			require("lspconfig")[server].setup {
				cmd = server_opts.cmd,
				settings = server_opts.settings,
				filetypes = server_opts.filetypes,
				capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {}),
			}
		end

		require("mason-lspconfig").setup {
			ensure_installed = opts.ensure_installed,
			handlers = { setup },
		}

		setup "sourcekit"
	end,
}
