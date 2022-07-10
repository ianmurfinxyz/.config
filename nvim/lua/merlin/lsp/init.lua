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
require('merlin.lsp.lsp-installer')

lspconfig.sumneko_lua.setup(require('merlin.lsp.settings.sumneko_lua'));
lspconfig.clangd.setup(require('merlin.lsp.settings.clangd'));


