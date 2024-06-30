vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- NOTE: UI
keymap.set("n", "<leader>us", "<cmd>set spell!<cr>", { desc = "Toggle spelling" })
keymap.set("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "Toggle word wrap" })
keymap.set("n", "<leader>uL", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative line numbers" })
keymap.set("n", "<leader>ul", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })

-- NOTE: Buffers
keymap.set("n", "<leader>bo", "<cmd>BufOnly<cr>", { desc = "Delete all other buffers" })

-- NOTE: Movement
keymap.set("n", "<c-d>", "<c-d>zz", { remap = true })
keymap.set("n", "<c-u>", "<c-u>zz", { remap = true })

-- Navigation easier
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Searching
keymap.set("n", "n", "nzzzv", { remap = true })
keymap.set("n", "N", "Nzzzv", { remap = true })

-- NOTE: Panes
keymap.set("n", "<leader>pv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>ph", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>pe", "<C-w>=", { desc = "Make panes equal size" })
keymap.set("n", "<leader>px", "<cmd>close<CR>", { desc = "Close current pane" })

-- NOTE: Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- NOTE: Diagnostic
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostics" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostics" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- NOTE: Other
keymap.set("n", "<leader>i", "gg=G<C-O>", { desc = "Indent file" })
