local lazydir = vim.fn.stdpath("data") .. "/lazy"

-- Debug
local osvpath = lazydir .. "/one-small-step-for-vimkind"
if (vim.uv or vim.loop).fs_stat(osvpath) then
  local nvim_config_debug = vim.env.NVIM_CONFIG_DEBUG
  -- local nvim_config_debug = "y"
  if nvim_config_debug ~= vim.NIL and nvim_config_debug == "y" then
    vim.opt.rtp:prepend(osvpath)
    vim.env.NVIM_CONFIG_DEBUG = ""
    require("osv").launch({ port = 8086 })
    vim.env.NVIM_CONFIG_DEBUG = nvim_config_debug
    vim.print("Press any key to continue")
    vim.fn.getchar()
  end
end
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
