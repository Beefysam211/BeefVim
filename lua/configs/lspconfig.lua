local on_attach = require("configs.lspconfig").on_attach
local on_init = require("configs.lspconfig").on_init
local capabilities = require("configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "bashls", "clangd", "vimls", "lua_ls", "zls" }

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    if client.name == "clangd" and client.resolved_capabilities then
      client.resolved_capabilities.document_formatting = true
    end
  end,
  on_init = on_init,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
