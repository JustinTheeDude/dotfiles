local actions = require('telescope.actions')

require("telescope").setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {}
}
require("telescope").load_extension "file_browser"
