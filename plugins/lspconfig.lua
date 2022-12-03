-- local function lsp_highlight_document(client)
-- 	-- Set autocommands conditional on server_capabilities
-- 	if client.server_capabilities.document_highlight then
-- 		vim.api.nvim_exec(
-- 			[[
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]],
-- 			false
-- 		)
-- 	end
-- end

-- Safely import lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local present, lspconfig = pcall(require, "lspconfig")
if not present then
	warn("LspConfig not installed")
	return
end

local servers = {
	"cssls",
	"bashls",
	"emmet_ls",
  "jdtls",
	"tsserver",
	"pyright",
  -- "autopep8",
  "elixir-ls",
  -- "prettier",
  "prismals",
	"rust_analyzer",
	"tailwindcss",
  "jdtls",
  "r-languageserver"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
