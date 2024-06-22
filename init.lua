vim.g.mapleader = " "

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

-- require("staline").setup {
--   defaults = {
--     expand_null_ls = false, -- This expands out all the null-ls sources to be shown
--     left_separator = "",
--     right_separator = "",
--     full_path = false,
--     line_column = "[%l/%L] :%c 󰍜 %p%% ", -- `:h stl` to see all flags.
--
--     fg = "#000000", -- Foreground text color.
--     bg = "none", -- Default background is transparent.
--     inactive_color = "#303030",
--     inactive_bgcolor = "none",
--     true_colors = false, -- true lsp colors.
--     font_active = "none", -- "bold", "italic", "bold,italic", etc
--
--     mod_symbol = "  ",
--     lsp_client_symbol = " ",
--     lsp_client_character_length = 12, -- Shorten LSP client names.
--     branch_symbol = " ",
--     cool_symbol = " ", -- Change this to override default OS icon.
--     null_ls_symbol = "", -- A symbol to indicate that a source is coming from null-ls
--   },
--   mode_colors = {
--     n = "#2bbb4f",
--     i = "#986fec",
--     c = "#e27d60",
--     v = "#4799eb", -- etc..
--   },
--   mode_icons = {
--     n = "󰋜 ",
--     i = "󰏪 ",
--     c = " ",
--     v = " ", -- etc..
--   },
--   sections = {
--     left = { "- ", "-mode", "left_sep_double", " ", "branch" },
--     mid = { "file_name" },
--     right = { "cool_symbol", "right_sep_double", "-line_column" },
--   },
--   inactive_sections = {
--     left = { "branch" },
--     mid = { "file_name" },
--     right = { "line_column" },
--   },
--   special_table = {
--     NvimTree = { "NvimTree", " " },
--     packer = { "Packer", " " }, -- etc
--   },
--   lsp_symbols = {
--     Error = " ",
--     Info = " ",
--     Warn = " ",
--     Hint = "",
--   },
-- }
--
-- require("stabline").setup {
--   style = "arrow",
--   bg = "#986fec",
--   fg = "black",
--   stab_right = "",
-- }

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
