return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon buffer 1", },
		{ "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon buffer 2", },
		{ "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon buffer 3", },
		{ "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon buffer 4", },
		{ "<leader>n", function() require("harpoon"):list():next() end, desc = "Harpoon next buffer", },
		{ "<leader>p", function() require("harpoon"):list():prev() end, desc = "Harpoon previous buffer", },
		{ "<leader>a", function() require("harpoon"):list():add() end, desc = "Add file to harpoon", },
		{ "<leader>e", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon toggle menu", },
	}
}
