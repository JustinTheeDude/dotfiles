require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "php",
    "json",
    "css",
    "html",
    "lua",
    "vue",
    "javascript"
  },
  autotag = {
    enable = true,
  },
}
