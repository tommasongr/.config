return {
	"olimorris/codecompanion.nvim",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				filetypes = {
					codecompanion = {
						prompt_for_file_name = false,
						template = "[Image]($FILE_PATH)",
						use_absolute_path = true,
					},
				},
			},
			keys = {
				{ "<leader>cp", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
			}
		}
	},
	opts = {
		strategies = {
			chat = {
				adapter = "openai"
			},
			inline = {
				adapter = "openai"
			},
			cmd = {
				adapter = "openai"
			}
		},
		adapters = {
			openai = function()
				return require("codecompanion.adapters").extend("openai", {
					env = {
						api_key = "cmd:op read op://Personal/OpenAIChat/credential --no-newline"
					}
				})
			end
		}
	},
	keys = {
		{ "<leader>sa", "<cmd>CodeCompanionActions<CR>", desc = "Search 🧠 Companion Actions", mode = { "n", "v" } },
		{ "<leader>cc", "<cmd>CodeCompanionChat Toggle<CR>", desc = "🧠 Companion Chat", mode = { "n", "v" } },
		{ "ga", "<cmd>CodeCompanionChat Add<CR>", desc = "Add to 🧠 Companion Chat", mode = { "v" } }
	}
}
