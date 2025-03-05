return {
  {
    'saghen/blink.cmp',
    version = 'v0.13.1',
    opts = {
      keymap = { preset = 'enter' },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
}
