vim.g.mapleader = " "
vim.keymap.set("n", "<leader>dv", "<CMD>Oil<CR>")

vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-.>", "<c-w>5<")
vim.keymap.set("n", "<C-,>", "<c-w>5>")
vim.keymap.set("n", "<C-t>", "<c-w>+>")
vim.keymap.set("n", "<C-s>", "<c-w>-")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("v", "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", '<Esc>"+pa')

vim.keymap.set("n", "<leader>env", ":edit .env<CR>", { desc = "Open .env file" })
