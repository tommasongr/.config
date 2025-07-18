return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		-- NOTE Text editing
		require("mini.ai").setup { n_lines = 100 }
		require("mini.move").setup()
		require("mini.pairs").setup()
		local surround = require "mini.surround"
		surround.setup {
			custom_surroundings = {
				["%"] = {
					input = { "%<%% ().-() %%%>" },
					output = { left = "<% ", right = " %>" },
				},
				["="] = {
					input = { "%<%%%= ().-() %%%>" },
					output = { left = "<%= ", right = " %>" },
				},
				["#"] = {
					input = { "%<%%%# ().-() %%%>" },
					output = { left = "<%# ", right = " %>" },
				},
			},
		}

		-- NOTE General worflow
		require("mini.bufremove").setup()
		local clue = require "mini.clue"
		clue.setup {
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<c-r>" },
				{ mode = "c", keys = "<c-r>" },

				-- window commands
				{ mode = "n", keys = "<c-w>" },
				{ mode = "n", keys = "<c-t>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},
			clues = {
				-- enhance this by adding descriptions for <leader> mapping groups
				{ mode = "n", keys = "<leader>b",  desc = "+Buffers" },
				{ mode = "n", keys = "<leader>c",  desc = "+Code" },
				{ mode = "n", keys = "<leader>q",  desc = "+Quickfix" },
				{ mode = "n", keys = "<leader>s",  desc = "+Search" },
				{ mode = "n", keys = "<leader>u",  desc = "+UI" },
				{ mode = "n", keys = "<c-t>",      desc = "+Tabs" },
				clue.gen_clues.builtin_completion(),
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				clue.gen_clues.windows(),
				clue.gen_clues.z(),
			},
			window = {
				config = { border = "single", width = 50 },
			},
		}
		require("mini.diff").setup {
			view = {
				style = vim.go.number and "number" or "sign",
				signs = {
					add = "+",
					change = "~",
					delete = "-",
				},
			},
		}
		require("mini.files").setup()
		vim.keymap.set("n", "<c-e>", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end, { desc = "Open file explorer" })
		vim.keymap.set("n", "<c-x>", function() MiniFiles.open() end, { desc = "Open fresh file explorer" })
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local b = args.data.buf_id

				vim.keymap.set("n", "gx", function()
					local fs_entry = MiniFiles.get_fs_entry()
					if not fs_entry then
						vim.notify("No file or directory under cursor", vim.log.levels.WARN)
						return
					end

					local path = fs_entry.path

					vim.system { "open", path }
				end, { buffer = b, desc = "Open URL" })
			end,
		})

		-- NOTE Appearance
		require("mini.hipatterns").setup {
			highlighters = {
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
			},
		}
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()
		require("mini.notify").setup()
		require("mini.statusline").setup()
	end,
}
