return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		-- NOTE Text editing
		require("mini.ai").setup { n_lines = 100 }
		require("mini.move").setup()
		require("mini.pairs").setup()
		local surround = require("mini.surround")
		surround.setup {
			custom_surroundings = {
				["%"] = {
					input = { "%<%% ().-() %%%>" },
					output = { left = "<% ", right = " %>" }
				},
				["="] = {
					input = { "%<%%%= ().-() %%%>" },
					output = { left = "<%= ", right = " %>" }
				},
				["#"] = {
					input = { "%<%%%# ().-() %%%>" },
					output = { left = "<%# ", right = " %>" }
				}
			}
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

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},
			clues = {
				-- enhance this by adding descriptions for <leader> mapping groups
				clue.gen_clues.builtin_completion(),
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				clue.gen_clues.windows(),
				clue.gen_clues.z(),
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
			}
		}
		require("mini.files").setup()
		vim.keymap.set("n", "<c-e>", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end, { desc = "Open file explorer" })
		vim.keymap.set("n", "<c-x>", function() MiniFiles.open() end, { desc = "Open fresh file explorer" })

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
	end
}
