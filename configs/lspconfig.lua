local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "tsserver", "clangd", "bashls", "lua_ls", "rust_analyzer", "nil_ls", "jsonls", "cssls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
--
--require('lspconfig').clangd.setup{
--  --filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto","hpp"},
--  cmd = {
--    "clangd",
--    "--offset-encoding=utf-16",
--  },
--}
