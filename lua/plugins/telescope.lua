return {
  {
    'nvim-telescope/telescope.nvim',
    version = 'v0.2.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          borderchars = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
          file_ignore_patterns = { 'node_modules', '.git', 'vendor' },

          mappings = {
            i = {
              ['<C-t>'] = require('trouble.sources.telescope').open,
            },
            n = {
              ['<C-t>'] = require('trouble.sources.telescope').open,
            },
          },
        },
        extensions = {
          fzf = { fuzzy = false },
        },
        pickers = {
          diagnostics = {
            theme = 'ivy',
            initial_mode = 'normal',
            layout_config = {
              preview_cutoff = 9999,
            },
          },
        },
      })
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({}),
          },
        },
      })
      require('telescope').load_extension('ui-select')
    end,
  },
}
