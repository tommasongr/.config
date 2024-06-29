return {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" }
  },
  -- config = function()
  --   vim.keymap.set("n", "<leader>S", "<cmd>lua require('spectre').toggle()<cr>", { desc = "Toggle Spectre" })
  -- end,
}
