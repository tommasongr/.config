return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      -- ensure_installed = {
      --   "c",
      --   "lua",
      --   "vim",
      --   "vimdoc",
      --   "query",
      --   "bash",
      --   "javascript",
      --   "typescript",
      --   "jsdoc",
      --   "json",
      --   "yaml",
      --   "xml",
      --   "html",
      --   "css",
      --   "markdown",
      --   "ruby",
      --   "embedded_template",
      --   "swift",
      -- },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see :help nvim-treesitter-incremental-selection-mod
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
