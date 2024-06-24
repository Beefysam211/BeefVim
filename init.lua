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

require("lazy").setup({ import = "plugins" }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

require("scope").setup {
  hooks = {
    pre_tab_leave = function()
      vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
      -- [other statements]
    end,

    post_tab_enter = function()
      vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
      -- [other statements]
    end,

    -- [other hooks]
  },

  -- [other options]
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "dracula",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

require("possession").setup {
  commands = {
    save = "SSave",
    load = "SLoad",
    delete = "SDelete",
    list = "SList",
  },
}

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
