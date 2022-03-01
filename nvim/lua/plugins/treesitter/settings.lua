require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "json",
    "html",
    "css",
    "scss",
    "javascript",
    "go",
    "graphql",
    "python",
    "typescript"
  },
}
