return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    {
      "<leader>ef",
      function()
        require("neo-tree.command").execute { toggle = true, dir = vim.loop.cwd() }
      end,
      desc = "Explore files",
    },
    {
      "<leader>eg",
      function()
        require("neo-tree.command").execute { source = "git_status", toggle = true }
      end,
      desc = "Explore git",
    },
    {
      "<leader>eb",
      function()
        require("neo-tree.command").execute { source = "buffers", toggle = true }
      end,
      desc = "Explore buffers",
    },
  },
  deactivate = function()
    vim.cmd [[Neotree close]]
  end,
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require "neo-tree"
      end
    end
  end,
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      position = "float",
      mappings = {
        ["<space>"] = "none",
        ["Y"] = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg("+", path, "c")
        end,
      },
    },
    -- default_component_configs = {
    --   icon = {
    --     folder_closed = "📁",
    --     folder_open = "📂",
    --     folder_empty = "📂",
    --     -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
    --     -- then these will never be used.
    --     default = "📃",
    --     highlight = "NeoTreeFileIcon",
    --   },
    --   git_status = {
    --     symbols = {
    --       -- Change type
    --       added = "A", -- or "✚", but this is redundant info if you use git_status_colors on the name
    --       modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
    --       deleted = "D", -- this can only be used in the git_status source
    --       renamed = "R", -- this can only be used in the git_status source
    --       -- Status type
    --       untracked = "*",
    --       ignored = "-",
    --       unstaged = "✗",
    --       staged = "✔︎",
    --       conflict = "❕",
    --     },
    --   },
    -- },
  },
  config = function(_, opts)
    local function on_move(data)
      -- Util.lsp.on_rename(data.source, data.destination)
    end

    local events = require "neo-tree.events"
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })
    require("neo-tree").setup(opts)
    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = function()
        if package.loaded["neo-tree.sources.git_status"] then
          require("neo-tree.sources.git_status").refresh()
        end
      end,
    })
  end,
}

-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--     "MunifTanjim/nui.nvim",
--     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
--   },
--   config = function()
--     require("neo-tree").setup {
--       close_if_last_window = false,
--       popup_border_style = "rounded",
--       enable_git_status = true,
--       enable_diagnostics = true,
--       default_component_configs = {
--         icon = {
--           folder_closed = "📁",
--           folder_open = "📂",
--           folder_empty = "📂",
--           -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
--           -- then these will never be used.
--           default = "📃",
--           highlight = "NeoTreeFileIcon",
--         },
--         git_status = {
--           symbols = {
--             -- Change type
--             added = "A", -- or "✚", but this is redundant info if you use git_status_colors on the name
--             modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
--             deleted = "D", -- this can only be used in the git_status source
--             renamed = "R", -- this can only be used in the git_status source
--             -- Status type
--             untracked = "*",
--             ignored = "-",
--             unstaged = "✗",
--             staged = "✔︎",
--             conflict = "❕",
--           },
--         },
--       },
--     }
--
--     vim.keymap.set("n", "<c-p>", ":Neotree toggle float<CR>")
--   end,
-- }
