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
          'graphql',
          'jsonls',
          'lua_ls',
          'marksman',
          'pyright',
          'rust_analyzer',
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
        rust_analyzer = {},
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
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          'gofumpt',
          'jsonls',
          'prettier',
          'rust_analyzer',
          'ruff',
          'stylua',
          'sql-formatter',
          'taplo',
        },
      })
    end,
    dependencies = { 'williamboman/mason.nvim' },
  },
}
