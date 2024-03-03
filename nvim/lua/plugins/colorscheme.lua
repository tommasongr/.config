return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,
  },
  {
    "oxfist/night-owl.nvim",
    -- priority = 1000,
  },
  {
    "savq/melange-nvim",
    -- priority = 1000,
  },
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
    -- priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    -- priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "tokyonight-night"
      vim.cmd.hi "Comment gui=none"
    end,
  },
}
