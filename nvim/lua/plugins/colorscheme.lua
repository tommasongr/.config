return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local catppuccin = require "catppuccin"

      catppuccin.setup {
        transparent_background = true,
      }

      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "oxfist/night-owl.nvim",
  },
  {
    "savq/melange-nvim",
  },
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "folke/tokyonight.nvim",
  },
}
