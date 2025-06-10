vim.lsp.config.tailwindcss_ls = {
	cmd = { "tailwindcss-language-server", "--stdio" },
	-- filetypes copied and adjusted from tailwindcss-intellisense
	root_markers = { "tailwind.config.js", "postcss.config.js", "package.json", ".git" },
	filetypes = {
		-- html
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
			validate = true,
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidScreen = "error",
				invalidVariant = "error",
				invalidConfigPath = "error",
				invalidTailwindDirective = "error",
				recommendedVariantOrder = "warning",
			},
			classAttributes = {
				"class",
				"className",
				"class:list",
				"classList",
				"ngClass",
			},
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
	capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
		textDocument = {
			completion = {
				completionItem = {
					-- this causes an error using native lsp
					snippetSupport = true, -- set to false if you don't use blink
				},
			},
		},
	}),
	before_init = function(_, config)
		if not config.settings then
			config.settings = {}
		end
		if not config.settings.editor then
			config.settings.editor = {}
		end
		if not config.settings.editor.tabSize then
			config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
		end
	end,
	workspace_required = true,
	root_dir = function(bufnr, on_dir)
		local root_files = {
			"tailwind.config.js",
			"tailwind.config.cjs",
			"tailwind.config.mjs",
			"tailwind.config.ts",
			"postcss.config.js",
			"postcss.config.cjs",
			"postcss.config.mjs",
			"postcss.config.ts",
		}

		function insert_package_json(config_files, field, fname)
			local path = vim.fn.fnamemodify(fname, ":h")
			local root_with_package = vim.fs.find({ "package.json", "package.json5" }, { path = path, upward = true })[1]

			if root_with_package then
				-- only add package.json if it contains field parameter
				for line in io.lines(root_with_package) do
					if line:find(field) then
						config_files[#config_files + 1] = vim.fs.basename(root_with_package)
						break
					end
				end
			end
			return config_files
		end

		local fname = vim.api.nvim_buf_get_name(bufnr)
		root_files = insert_package_json(root_files, "tailwindcss", fname)
		on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
	end,
}
