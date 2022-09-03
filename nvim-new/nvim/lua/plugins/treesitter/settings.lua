require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
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
