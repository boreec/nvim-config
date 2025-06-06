return {
  {
    'ramilito/kubectl.nvim',
    version = 'v2.0.0',
    config = function()
      require('kubectl').setup()
    end,
    opts = {},
    cmd = { 'Kubectl', 'Kubectx', 'Kubens' },
    keys = {
      { '<leader>K', '<cmd>lua require("kubectl").toggle()<cr>' },
      { '<C-k>', '<Plug>(kubectl.kill)', ft = 'k8s_*' },
      { '7', '<Plug>(kubectl.view_nodes)', ft = 'k8s_*' },
      { '8', '<Plug>(kubectl.view_overview)', ft = 'k8s_*' },
      { '<C-t>', '<Plug>(kubectl.view_top)', ft = 'k8s_*' },
    },
  },
}
