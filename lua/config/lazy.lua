-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out =
    vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup({
  spec = {
    -- import your plugins
    { import = 'plugins' },
  },
  rocks = { enabled = false },
  concurrency = 8,
  checker = { enabled = false },
})

-- Workaround for a lazy.nvim render stall on Neovim 0.12 where the update window
-- freezes on "fetch" even though plugins finish updating. Redraw the Lazy window
-- directly while it is open.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lazy',
  callback = function(ev)
    local timer = assert((vim.uv or vim.loop).new_timer())
    timer:start(
      100,
      100,
      vim.schedule_wrap(function()
        local visible = vim.api.nvim_buf_is_valid(ev.buf)
          and vim.bo[ev.buf].filetype == 'lazy'
          and vim.fn.bufwinid(ev.buf) ~= -1
        if not visible then
          if not timer:is_closing() then
            timer:stop()
            timer:close()
          end
          return
        end
        local ok, view = pcall(require, 'lazy.view')
        if ok and view.view and view.view.render then
          pcall(function()
            view.view.render:update()
          end)
        end
      end)
    )
  end,
})
