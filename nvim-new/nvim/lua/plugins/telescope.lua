return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    local conf = require('telescope.config').values

    vim.keymap.set('n', '<leader>f', builtin.find_files, {})
    vim.keymap.set('n', '<leader>g', builtin.live_grep, table.insert(conf.vimgrep_arguments, '--fixed-strings'))
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
  end
}
