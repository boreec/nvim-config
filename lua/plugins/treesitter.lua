return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    init = function()
      local ensure_installed = {
        'bash',
        'c',
        'cpp',
        'csv',
        'dockerfile',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gotmpl',
        'gowork',
        'graphql',
        'hcl',
        'json',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'proto',
        'rust',
        'sql',
        'terraform',
        'toml',
        'typescript',
        'xml',
        'yaml',
      }
      local installed = require('nvim-treesitter.config').get_installed()
      local to_install = vim.iter(ensure_installed)
        :filter(function(p)
          return not vim.tbl_contains(installed, p)
        end)
        :totable()
      if #to_install > 0 then
        require('nvim-treesitter').install(to_install)
      end

      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      vim.api.nvim_set_hl(0, '@markup.link.url.markdown_inline', { undercurl = false })
    end,
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
          require('treesitter-context').setup({
            enable = true,
            line_numbers = true,
            mode = 'topline',
            multiline_threshold = 5,
          })
        end,
      },
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        config = function()
          require('nvim-treesitter-textobjects').setup({
            select = {
              lookahead = true,
            },
          })

          local select = require('nvim-treesitter-textobjects.select')
          vim.keymap.set({ 'x', 'o' }, 'af', function()
            select.select_textobject('@function.outer', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'if', function()
            select.select_textobject('@function.inner', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'ac', function()
            select.select_textobject('@class.outer', 'textobjects')
          end)
          vim.keymap.set({ 'x', 'o' }, 'ic', function()
            select.select_textobject('@class.inner', 'textobjects')
          end)
        end,
      },
    },
  },
}
