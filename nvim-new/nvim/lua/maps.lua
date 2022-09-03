local keymap = vim.keymap
vim.g.mapleader = ","

keymap.set("n", "<leader>w", ":w <CR>")
keymap.set("n", "<leader>f", ":Telescope find_files <CR>")
keymap.set("n", "<leader>d", ":Telescope file_browser <CR>")

keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-l>', '<C-w>l')
