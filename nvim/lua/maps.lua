local keymap = vim.keymap
vim.g.mapleader = " "

keymap.set("n", "<leader>w", ":w <CR>")
keymap.set("n", "<leader>ff", ":Telescope find_files <CR>")
keymap.set("n", "<leader>g", ":Telescope live_grep <CR>")
keymap.set("n", "<leader>b", ":Telescope buffers <CR>")
keymap.set("n", "<leader>gg", ":Telescope grep_string <CR>")
keymap.set("n", "<leader>f", ":set foldmethod=indent <CR>")

keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-l>', '<C-w>l')
