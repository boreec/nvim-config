return {
  -- Plugin to manage and install LSP servers, linters and formatters.
  {
    'williamboman/mason.nvim',
    version = 'v2.0.0',
    config = function()
      require('mason').setup()
    end,
  },
  -- Plugin extension to make Mason easier to use with nvim-lspconfig.
  {
    'williamboman/mason-lspconfig.nvim',
    version = 'v2.0.0',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'gopls',
          'graphql',
          'jsonls',
          'lua_ls',
          'marksman',
          'pyright',
          'terraformls',
          'tflint',
          'ts_ls',
        },
      })
    end,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
    },
  },
  -- Plugin to setup LSP servers.
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    version = 'v2.1.0',
    opts = {
      servers = {
        gopls = {
          gofumpt = true,
        },
        graphql = {},
        jsonls = {},
        lua_ls = {
          settings = {
            Lua = {
              -- prevent warnings by recognizing vim as a global variable
              diagnostics = { globals = { 'vim' } },
            },
          },
        },
        marksman = {},
        pyright = {},
        ruff = {},
        terraformls = {},
        tflint = {},
        ts_ls = {},
      },
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
  -- Plugin to install required linters and formatters.
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    commit = '75d60a8f928decd8b38897f80849768b7c540a5b',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          'gofumpt',
          'jsonls',
          'prettier',
          'ruff',
          'stylua',
          'sql-formatter',
          'taplo',
        },
      })
    end,
    dependencies = { 'williamboman/mason.nvim' },
  },
  -- Plugin dedicated to the rust language, operates on its own.
  {
    'mrcjkb/rustaceanvim',
    version = '6.2.0',
    lazy = false,
  },
}
