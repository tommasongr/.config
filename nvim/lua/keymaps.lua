-- NOTE: UI
vim.keymap.set("n", "<leader>us", "<cmd>set spell!<cr>", { desc = "Toggle spelling" })
vim.keymap.set("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "Toggle word wrap" })
vim.keymap.set("n", "<leader>uL", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative line numbers" })
vim.keymap.set("n", "<leader>ul", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })
-- vim.keymap.set("n", "<leader>ud", "<cmd>set diagnostic!<cr>", { desc = "Toggle diagnostic" })

-- NOTE: Buffers
vim.keymap.set("n", "<leader>bo", "<cmd>BufOnly<cr>", { desc = "Delete all other buffers" })

-- NOTE: Movement
vim.keymap.set("n", "<c-d>", "<c-d>zz", { remap = true })
vim.keymap.set("n", "<c-u>", "<c-u>zz", { remap = true })

-- Navigation easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- NOTE: Searching
vim.keymap.set("n", "n", "nzzzv", { remap = true })
vim.keymap.set("n", "N", "Nzzzv", { remap = true })

-- NOTE: Tabs
-- vim.keymap.set("n", "<Tab>", vim.cmd.tabnext)
-- vim.keymap.set("n", "<S-Tab>", vim.cmd.tabprev) -- Not working...
-- vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)

-- NOTE: Diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostics" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostics" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- NOTE: Other
vim.keymap.set("n", "<leader>i", "gg=G<C-O>", { desc = "Indent file" })
