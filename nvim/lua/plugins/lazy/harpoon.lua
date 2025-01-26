return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim"
	},
	keys = function()
		local harpoon = require("harpoon")
		local conf = require("telescope.config").values

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end
			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table {
					results = file_paths
				},
				previewer = conf.file_previewer {},
				sorter = conf.generic_sorter {}
			}):find()
		end

		return {
			{ "<leader>1", function() harpoon:list():select(1) end, desc = "Harpoon buffer 1" },
			{ "<leader>2", function() harpoon:list():select(2) end, desc = "Harpoon buffer 2" },
			{ "<leader>3", function() harpoon:list():select(3) end, desc = "Harpoon buffer 3" },
			{ "<leader>4", function() harpoon:list():select(4) end, desc = "Harpoon buffer 4" },

			{ "<leader>n", function() harpoon:list():next() end, desc = "Harpoon next buffer" },
			{ "<leader>p", function() harpoon:list():prev() end, desc = "Harpoon previous buffer" },

			{ "<leader>a", function() harpoon:list():add() end, desc = "Add file to harpoon" },
			{ "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon toggle menu" },

			{ "<leader>se", function() toggle_telescope(harpoon:list()) end, desc = "Search Harpoon files" }
		}
	end
}
