return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = 'v0.9.3',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        additional_vim_regex_highlighting = false,
        -- The listed parsers MUST always be installed
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'dockerfile',
          'gitignore',
          'go',
          'gomod',
          'gosum',
          'gotmpl',
          'gowork',
          'graphql',
          'hcl',
          'json',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'python',
          'proto',
          'rust',
          'sql',
          'terraform',
          'toml',
          'typescript',
          'xml',
          'yaml',
        },
        highlight = { enable = true },
        indent = { enable = true },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
        },
      })
      -- Remove the undercul for markdown links
      vim.api.nvim_set_hl(0, '@markup.link.url.markdown_inline', { undercurl = false })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },
}
