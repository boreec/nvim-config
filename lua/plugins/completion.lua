return {
  {
    'saghen/blink.cmp',
    opts = {
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 250 },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      keymap = { preset = 'enter' },
      signature = { enabled = true, window = { show_documentation = false } },
      sources = {
        default = { 'lsp' },
      },
    },
    version = 'v1.1.1',
  },
}
