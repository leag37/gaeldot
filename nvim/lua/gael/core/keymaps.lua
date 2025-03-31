vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness?

-- Basic text
--keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>clear", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split a window in two" })
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Vertical split" })
keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Horizontal split" })
keymap.set("n", "<leader>wq", "<C-w>q", { desc = "Close current window" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make window splits equal in size" })
keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to the next split cycling right" })
keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to the next split cycling down" })
keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to the next split cycling up" })
keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to the next split cycling left" })

-- Tabs
keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Create a new tab" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close the current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open the current buffer in new tab" })

-- Exiting nvim quickly
keymap.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit NVIM" })
