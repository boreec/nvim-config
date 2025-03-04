return {
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
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
