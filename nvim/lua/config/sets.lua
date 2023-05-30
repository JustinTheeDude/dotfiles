vim.cmd("autocmd!")

vim.g.mapleader = " "

--indentation
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.termguicolors = true
vim.opt.smartindent = true
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.wildignore = {
  '**/node_modules/**',
  '**/.git/**',
}
