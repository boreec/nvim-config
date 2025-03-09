-- Common options for mappings
local opt = { noremap = true, silent = true }

-- Telescope mappings
local telescope = require('telescope.builtin')
local telescope_mappings = {
  ['<leader>ff'] = telescope.find_files,
  ['<leader>fg'] = telescope.live_grep,
}

vim.keymap.set('n', '<leader>fb', function()
  telescope.buffers({
    sort_mru = true,
    ignore_current_buffer = true,
  })
end)

for key, action in pairs(telescope_mappings) do
  vim.keymap.set('n', key, action, opt)
end

-- LSP mappings
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opt)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opt)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opt)
vim.keymap.set('n', '<leader>fr', function()
  vim.lsp.buf.format({ async = true })
end, opt)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    local lsp_mappings = {
      ['gd'] = telescope.lsp_definitions,
      ['gi'] = telescope.lsp_implementations,
      ['<leader>d'] = telescope.diagnostics,
      ['<leader>s'] = telescope.lsp_document_symbols,
      ['gr'] = telescope.lsp_references,
    }
    for key, action in pairs(lsp_mappings) do
      vim.keymap.set('n', key, action, {})
    end
  end,
})

-- Harpoon mappings
local harpoon = require('harpoon')
harpoon:setup()

vim.keymap.set('n', '<leader>ha', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<leader>hl', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end)
vim.keymap.set('n', '<leader>5', function()
  harpoon:list():select(5)
end)
vim.keymap.set('n', '<leader>hp', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<leader>hn', function()
  harpoon:list():next()
end)
