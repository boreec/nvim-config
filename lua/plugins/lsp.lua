return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'gopls',
          'lua_ls',
        },
      })
    end,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    opts = {
      servers = {
        gopls = {
          gofumpt = true,
        },
        lua_ls = {
          settings = {
            Lua = {
              -- prevent warnings by recognizing vim as a global variable
              diagnostics = { globals = { 'vim' } },
            },
          },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          'gofumpt',
          'taplo',
          'stylua',
          'sql-formatter',
        },
      })
    end,
    dependencies = { 'williamboman/mason.nvim' },
  },
}
