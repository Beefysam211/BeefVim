local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "htmlbeautifier" },
    javascript = { "prettierd" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    arduino = { "clang_format" },
    python = { "black" },
    bash = { "beautysh" },
    json = { "prettierd" },
    sh = { { "shellcheck" } },
    markdown = { "mdformat" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
