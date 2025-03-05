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
    config = function()
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            -- prevent warnings by recognizing vim as a global variable
            diagnostics = { globals = { 'vim' } },
          },
        },
      })
      require('lspconfig').gopls.setup({})
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          'taplo',
          'stylua',
          'sql-formatter',
        },
      })
    end,
    dependencies = { 'williamboman/mason.nvim' },
  },
}
