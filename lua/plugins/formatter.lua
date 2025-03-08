return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          go = { 'gofumpt' },
          graphql = { 'prettier' },
          json = { 'prettier' },
          lua = { 'stylua' },
          markdown = { 'prettier' },
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
