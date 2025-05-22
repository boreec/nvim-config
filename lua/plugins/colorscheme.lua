return {
  {
    'projekt0n/github-nvim-theme',
    version = 'v1.1.2',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({
        options = {
          styles = {
            comments = 'NONE',
            functions = 'bold',
            keywords = 'bold',
            types = 'bold',
          },
        },
      })
      vim.cmd([[colorscheme github_dark]])
    end,
  },
}
