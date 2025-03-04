return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')

      -- Telescope setup
      telescope.setup({
        defaults = {
          borderchars = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
          file_ignore_patterns = { 'node_modules', '.git', 'vendor' },
        },
      })

      -- Key mappings
      local opt = { noremap = true, silent = true }
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<Leader>ff', builtin.find_files, opt)
      vim.keymap.set('n', '<Leader>fg', builtin.live_grep, opt)
      vim.keymap.set('n', '<Leader>fb', builtin.buffers, opt)
    end,
  },
}
