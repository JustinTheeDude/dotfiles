local actions = require('telescope.actions')

require("telescope").setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
        },
        ["n"] = {
        },
      },
    },
  },
}
require("telescope").load_extension "file_browser"
