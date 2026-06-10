return {
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    -- Inline diagnostics are opt-in since Neovim 0.11. init runs at startup
    -- even though the plugin only loads lazily on :Trouble.
    init = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = true,
        },
      })

      -- Auto-open/close the panel ourselves. Trouble's own auto_open/auto_close
      -- don't arm until the panel is opened once (missing the first diagnostic)
      -- and duplicate it after a manual open. vim.schedule lets Trouble refresh
      -- its items first; the :Trouble command opens synchronously where the Lua
      -- API defers.
      vim.api.nvim_create_autocmd('DiagnosticChanged', {
        callback = function()
          vim.schedule(function()
            if #vim.diagnostic.get() > 0 then
              vim.cmd('Trouble diagnostics open focus=false')
            else
              vim.cmd('Trouble diagnostics close')
            end
          end)
        end,
      })
    end,
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}
