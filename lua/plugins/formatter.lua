return {
  {
    'stevearc/conform.nvim',
    version = 'v9.0.0',
    event = { 'BufWritePre' },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          go = { 'gofumpt', 'goimports' },
          json = { 'prettier' },
          lua = { 'stylua' },
          markdown = { 'prettier' },
          rust = { 'rustfmt' },
          toml = { 'taplo' },
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
