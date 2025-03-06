-- Common options for mappings
local opt = { noremap = true, silent = true }

-- === General Mappings ===
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opt)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opt)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opt)
vim.keymap.set('n', '<leader>fr', function()
  vim.lsp.buf.format({ async = true })
end, opt)

-- === Telescope Mappings (Always Available) ===
local telescope = require('telescope.builtin')
local telescope_mappings = {
  ['<leader>ff'] = telescope.find_files,
  ['<leader>fg'] = telescope.live_grep,
  ['<leader>fb'] = telescope.buffers,
}
for key, action in pairs(telescope_mappings) do
  vim.keymap.set('n', key, action, opt)
end

-- === LSP-Specific Mappings (Only When an LSP Attaches) ===
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local lsp_opts = { noremap = true, silent = true, buffer = args.buf }
    local lsp_mappings = {
      ['gd'] = telescope.lsp_definitions,
      ['gi'] = telescope.lsp_implementations,
      ['<leader>d'] = telescope.diagnostics,
      ['<leader>s'] = telescope.lsp_document_symbols,
      ['gr'] = telescope.lsp_references,
    }
    for key, action in pairs(lsp_mappings) do
      vim.keymap.set('n', key, action, lsp_opts)
    end
  end,
})
