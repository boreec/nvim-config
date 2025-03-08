return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
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
          'json',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'python',
          'proto',
          'rust',
          'sql',
          'toml',
          'typescript',
          'xml',
          'yaml',
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        highlight = { enable = true },
        additional_vim_regex_highlighting = false,
        indent = { enable = true },
      })
      -- Remove the undercul for markdown links
      vim.api.nvim_set_hl(0, '@markup.link.url.markdown_inline', { undercurl = false })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        enable = true,
      })
    end,
  },
}
