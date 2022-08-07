--------------------------------------------------------------------------------
-- NEOVIM LANGUAGE SERVER CONFIGURATION
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
	print "Failed to find the lsp-config plugin; cannot configure lsp"
	return
end

-- Must call nvim-lsp-installer setup function before we setup any servers
-- so that the installer can setup the server hooks.
require('merlin.lsp.server_installer')

local opts = {
	on_attach = require('merlin.lsp.handlers').on_attach
}

local sumneko_opts = vim.tbl_deep_extend('force', opts, require('merlin.lsp.settings.sumneko_lua'))
lspconfig.sumneko_lua.setup(sumneko_opts);

local clangd_opts = vim.tbl_deep_extend('force', opts, require('merlin.lsp.settings.clangd'))
lspconfig.clangd.setup(clangd_opts);

local pyright_opts = vim.tbl_deep_extend('force', opts, require('merlin.lsp.settings.pyright'))
lspconfig.pyright.setup(pyright_opts);

local rust_opts = vim.tbl_deep_extend('force', opts, require('merlin.lsp.settings.rust_analyzer'))
lspconfig.rust_analyzer.setup(rust_opts)



