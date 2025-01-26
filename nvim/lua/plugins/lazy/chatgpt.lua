return {
	"jackMort/ChatGPT.nvim",
	cmd = {
		"ChatGPT",
		"ChatGPTActAs",
		"ChatGPTCompleteCode",
		"ChatGPTEditWithInstructions",
		"ChatGPTRun"
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim", -- optional
		"nvim-telescope/telescope.nvim"
	},
	opts = {
		api_key_cmd = "op read op://Personal/ChatGPT.nvim/credential --no-newline",
		openai_params = {
			model = "gpt-4o-mini",
		},
		openai_edit_params = {
			model = "gpt-4o-mini",
		}
	},
	keys = {
		{ "<leader>cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
		{ "<leader>cs", "<cmd>ChatGPTCompleteCode<CR>", desc = "ChatGPT Suggest completion" },
		{ "<leader>ce", "<cmd>ChatGPTEditWithInstructions<CR>", desc = "ChatGPT Edit with instruction", mode = { "n", "v" } },

		{ "<leader>crd", "<cmd>ChatGPTRun docstring<CR>", desc = "ChatGPT Docstring", mode = { "n", "v" } },
		{ "<leader>crt", "<cmd>ChatGPTRun add_tests<CR>", desc = "ChatGPT Add Tests", mode = { "n", "v" } },
		{ "<leader>cro", "<cmd>ChatGPTRun optimize_code<CR>", desc = "ChatGPT Optimize Code", mode = { "n", "v" } },
		{ "<leader>crs", "<cmd>ChatGPTRun summarize<CR>", desc = "ChatGPT Summarize", mode = { "n", "v" } },
		{ "<leader>crf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "ChatGPT Fix Bugs", mode = { "n", "v" } },
		{ "<leader>crx", "<cmd>ChatGPTRun explain_code<CR>", desc = "ChatGPT Explain Code", mode = { "n", "v" } },
	}
}
