return {
	"neovim/nvim-lspconfig",
	enabled = false,
	dependencies = {
		{
			"mason-org/mason.nvim",
			cmd = "Mason",
			lazy = false,
			build = ":MasonUpdate",
			config = function()
				require("mason").setup()
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup {
					ensure_installed = {
						"cssls",
						"emmet_language_server",
						"html",
						"lua_ls",
						"ruby_lsp",
						"tailwindcss",
						"ts_ls",
					},
					automatic_installation = true,
				}
			end,
		},
	},
	opts = {
		servers = {
			cssls = {},
			emmet_language_server = {},
			html = {
				filetypes = { "html", "templ", "eruby", "embedded_template" },
			},
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim", "require" } },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true)
						},
						telemetry = { enable = false }
					},
				},
			},
			ruby_lsp = {
				cmd = { "ruby-lsp" },
				filetypes = { "ruby", "eruby" },
				init_options = {
					formatter = "auto",
				},
			},
			tailwindcss = {
				filetypes = {
					-- html
					"html.erb",
					"aspnetcorerazor",
					"astro",
					"astro-markdown",
					"blade",
					"clojure",
					"django-html",
					"htmldjango",
					"edge",
					"eelixir", -- vim ft
					"elixir",
					"ejs",
					"erb",
					"eruby", -- vim ft
					"gohtml",
					"gohtmltmpl",
					"haml",
					"handlebars",
					"hbs",
					"html",
					"htmlangular",
					"html-eex",
					"heex",
					"jade",
					"leaf",
					"liquid",
					"markdown",
					"mdx",
					"mustache",
					"njk",
					"nunjucks",
					"php",
					"razor",
					"slim",
					"twig",
					-- css
					"css",
					"less",
					"postcss",
					"sass",
					"scss",
					"stylus",
					"sugarss",
					-- js
					"javascript",
					"javascriptreact",
					"reason",
					"rescript",
					"typescript",
					"typescriptreact",
					-- mixed
					"vue",
					"svelte",
					"templ",
				},
				settings = {
					tailwindCSS = {
						includeLanguages = {
							eelixir = "html-eex",
							eruby = "erb",
							templ = "html",
							htmlangular = "html",
						},
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
			ts_ls = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require "lspconfig"

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.offsetEncoding = { "utf-16" }

		for name, options in pairs(opts.servers) do
			options.capabilities = capabilities
			lspconfig[name].setup(options)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(event)
				local options = { buffer = event.buffer, silent = true }

				options.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)

				options.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)

				options.desc = "Show LSP references"
				vim.keymap.set("n", "gr", vim.lsp.buf.references, options)

				options.desc = "Show documentation"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, options)

				options.desc = "Smart rename"
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, options)

				options.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options)
			end,
		})
	end,
}
