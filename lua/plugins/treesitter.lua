-- nvim-treesitter `main` branch: the `master` branch is frozen and breaks on
-- Neovim 0.12. `main` drops `configs.setup{}` in favour of `install()` plus
-- enabling highlight/indent per buffer, and needs the `tree-sitter` CLI and a
-- C compiler on PATH to build parsers.
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
  'zig',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
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
      },
    },
    config = function()
      -- Install missing parsers.
      local installed = require('nvim-treesitter.config').get_installed()
      local to_install = vim.tbl_filter(function(parser)
        return not vim.tbl_contains(installed, parser)
      end, ensure_installed)
      if #to_install > 0 then
        require('nvim-treesitter').install(to_install)
      end

      -- Enable highlight + indent + folds per buffer. The pcall skips filetypes
      -- with no parser so we don't clobber their indentexpr.
      local function start(buf)
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if lang and pcall(vim.treesitter.start, buf, lang) then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          -- foldexpr is core (0.12); it is window-local, so set it on every
          -- window currently showing this buffer.
          for _, win in ipairs(vim.fn.win_findbuf(buf)) do
            vim.wo[win][0].foldmethod = 'expr'
            vim.wo[win][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          end
        end
      end

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          start(args.buf)
        end,
      })

      -- FileType won't fire for buffers already open (e.g. a file passed on
      -- the command line), so start them now.
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          start(buf)
        end
      end

      -- On `main`, textobject keymaps are registered by hand.
      require('nvim-treesitter-textobjects').setup({
        select = { lookahead = true },
      })
      local select = require('nvim-treesitter-textobjects.select')
      local textobjects = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
      for key, capture in pairs(textobjects) do
        vim.keymap.set({ 'x', 'o' }, key, function()
          select.select_textobject(capture, 'textobjects')
        end, { desc = 'Select ' .. capture })
      end

      -- Remove the undercurl for markdown links.
      vim.api.nvim_set_hl(0, '@markup.link.url.markdown_inline', { undercurl = false })
    end,
  },
}
