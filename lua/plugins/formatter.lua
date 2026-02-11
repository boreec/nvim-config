return {
  {
    'stevearc/conform.nvim',
    version = 'v9.1.0',
    event = { 'BufWritePre' },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          go = { 'gofumpt', 'goimports' },
          html = { 'biome' },
          json = { 'biome' },
          lua = { 'stylua' },
          markdown = { 'biome' },
          rust = { 'rustfmt' },
          toml = { 'taplo' },
          typescript = { 'biome' },
          ['_'] = { 'trim_whitespace', 'trim_newlines' },
        },
        format_on_save = {
          timeout_ms = 2000,
          lsp_format = 'fallback',
        },
      })
    end,
  },
}
