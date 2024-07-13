return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
    },
    config = function(_, opts)
      local kanagawa = require "kanagawa"
      kanagawa.setup(opts)
      vim.cmd "colorscheme kanagawa-wave"
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    opts = {
      transparent_bg = true,
    },
    config = function(_, opts)
      -- Dracula configuration (if needed)
      local dracula = require "dracula"
      dracula.setup(opts)
      vim.cmd "colorscheme dracula"
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      -- TokyoNight configuration (if needed)
    end,
  },
  {
    "zootedb0t/citruszest.nvim",
    lazy = true,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
    config = function()
      require("github-theme").setup {
        -- GitHub theme configuration (if needed)
      }
    end,
  },
  {
    -- dir = "~/dev/eldritch-workspace/eldritch.nvim",
    "eldritch-theme/eldritch.nvim",
    lazy = true,
    opts = {
      transparent = false,
    },
    config = function(_, opts)
      local eldritch = require "eldritch"
      eldritch.setup(opts)
      vim.cmd [[colorscheme eldritch]]
    end,
  },
  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    config = function()
      -- add your config
    end,
  },
}
