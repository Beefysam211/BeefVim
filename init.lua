vim.g.mapleader = " "
vim.g.have_nerd_font = true

require "keymaps"
require "options"
require "autocmds"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {
  concurrency = jit.os:find "Windows" and (vim.loop.available_parallelism() * 2) or nil,
  install = {
    colorscheme = { "kanaga-wave" },
    missing = true,
  },
  checker = {
    enabled = true,
    concurrency = 3,
    frequency = 3600,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  ui = {
    border = "rounded",
    backdrop = 100,
  },
  performance = {
    cache = {
      enabled = true,
    },
  },
})

require "configs.dap"
require "configs.lualine"
require "configs.scope"

require("image").setup {
  render = {
    min_padding = 5,
    show_label = true,
    show_image_dimensions = true,
    use_dither = true,
    foreground_color = false,
    background_color = false,
  },
  events = {
    update_on_nvim_resize = true,
  },
}
