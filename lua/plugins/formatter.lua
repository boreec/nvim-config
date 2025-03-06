return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          go = { 'gofumpt' },
          json = { 'prettier' },
          lua = { 'stylua' },
          sql = { 'sql_formatter' },
          toml = { 'taplo' },
          typescript = { 'prettier' },
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
