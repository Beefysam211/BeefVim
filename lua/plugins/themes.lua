return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   -- priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd [[colorscheme tokyonight]]
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup {
        transparent = true, -- Enable this to make the background transparent
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      }
      vim.cmd "colorscheme kanagawa-wave"
    end,
  },
  -- {
  --   "zootedb0t/citruszest.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd "colorscheme citruszest"
  --   end,
  -- },
  -- {
  --   "projekt0n/github-nvim-theme",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   -- priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("github-theme").setup {
  --       -- ...
  --     }
  --
  --     vim.cmd "colorscheme github_dark"
  --   end,
  -- },
}
