return {
  {
    'projekt0n/github-nvim-theme',
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
      vim.cmd('colorscheme github_dark')
    end,
  },
}
