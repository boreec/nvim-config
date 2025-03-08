return {
  {
    'saghen/blink.cmp',
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      draw = {
        columns = {
          { 'label', 'label_description', gap = 1 },
          { 'kind_icon', 'kind' },
        },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    opts = {
      keymap = { preset = 'enter' },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    version = 'v0.13.1',
  },
}
