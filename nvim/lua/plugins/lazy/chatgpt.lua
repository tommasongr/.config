return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	-- cmd = {
	-- 	"ChatGPT",
	-- 	"ChatGPTActAs",
	-- 	"ChatGPTCompleteCode",
	-- 	"ChatGPTEditWithInstructions",
	-- 	"ChatGPTRun"
	-- },
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim", -- optional
		"nvim-telescope/telescope.nvim"
	},
	config = function()
		local chatgpt = require("chatgpt")

		chatgpt.setup {
			api_key_cmd = "op read op://Personal/ChatGPT.nvim/credential --no-newline",
			openai_params = {
				model = "gpt-4o-mini",
			},
			openai_edit_params = {
				model = "gpt-4o-mini",
			}
		}
	end,
	keys = {
		{ "<leader>cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
		{ "<leader>cs", "<cmd>ChatGPTCompleteCode<CR>", desc = "ChatGPT Suggest completion" },
		{ "<leader>ce", "<cmd>ChatGPTEditWithInstructions<CR>", desc = "ChatGPT Edit with instruction", mode = { "n", "v" } },

		-- { "<leader>crg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "ChatGPT Grammar Correction", mode = { "n", "v" } },
		-- { "<leader>crt", "<cmd>ChatGPTRun translate<CR>", desc = "ChatGPT Translate", mode = { "n", "v" } },
		-- { "<leader>crk", "<cmd>ChatGPTRun keywords<CR>", desc = "ChatGPT Keywords", mode = { "n", "v" } },
		{ "<leader>crd", "<cmd>ChatGPTRun docstring<CR>", desc = "ChatGPT Docstring", mode = { "n", "v" } },
		{ "<leader>crt", "<cmd>ChatGPTRun add_tests<CR>", desc = "ChatGPT Add Tests", mode = { "n", "v" } },
		{ "<leader>cro", "<cmd>ChatGPTRun optimize_code<CR>", desc = "ChatGPT Optimize Code", mode = { "n", "v" } },
		{ "<leader>crs", "<cmd>ChatGPTRun summarize<CR>", desc = "ChatGPT Summarize", mode = { "n", "v" } },
		{ "<leader>crf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "ChatGPT Fix Bugs", mode = { "n", "v" } },
		{ "<leader>crx", "<cmd>ChatGPTRun explain_code<CR>", desc = "ChatGPT Explain Code", mode = { "n", "v" } },
		-- { "<leader>crr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "ChatGPT Roxygen Edit", mode = { "n", "v" } },
		-- { "<leader>crl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "ChatGPT Code Readability Analysis", mode = { "n", "v" } },
	}
}
