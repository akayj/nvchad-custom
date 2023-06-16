local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local autoformat_on_attach = function(client, bufnr)
--   if client.supports_method "textDocument/formatting" then
--     vim.api.nvim_clear_autocmds { group = augroup, bufnr = bufnr }
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = augroup,
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.formatting { async = false }
--       end,
--     })
--   end
--
--   return on_attach(client, bufnr)
-- end

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "volar" }

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- lspconfig.pyright.setup { blabla}

-- lspconfig.gopls
require("custom/configs/lsp/go")

-- lspconfig.rust_analyzer
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require("custom/configs/lsp/rust")
