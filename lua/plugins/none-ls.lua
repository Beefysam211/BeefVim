return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  requires = { "nvim-lua/plenary.nvim" },

  config = function()
    local null_ls = require "null-ls"
    null_ls.setup {
      sources = {
        --code-actions
        -- null_ls.builtins.code_actions.eslint_d,

        --formatting
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.clang_format,

        --diagnostics

        require "none-ls.diagnostics.eslint_d", -- requires none-ls-extras.nvim
        -- null_ls.builtins.diagnostics.luacheck,
        -- null_ls.builtins.diagnostics.clangd,
        -- null_ls.builtins.diagnostics.eslint_d,
      },
    }
  end,
}
