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

-- Setup cosmetic stuff like virtual text and signs
require('merlin.lsp.style')

-- Setup border for lsp floating windows
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
--vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
--vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
	{"╭", "FloatBorder"},
	{"─", "FloatBorder"},
	{"╮", "FloatBorder"},
	{"│", "FloatBorder"},
	{"╯", "FloatBorder"},
	{"─", "FloatBorder"},
	{"╰", "FloatBorder"},
	{"│", "FloatBorder"},
}

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

local opts = {
	on_attach = require('merlin.lsp.key_maps').on_attach,
	handlers = handlers
}

local sumneko_opts = vim.tbl_deep_extend('force', opts, require('merlin.lsp.settings.sumneko_lua'))
lspconfig.sumneko_lua.setup(sumneko_opts);

local clangd_opts = vim.tbl_deep_extend('force', opts, require('merlin.lsp.settings.clangd'))
lspconfig.clangd.setup(clangd_opts);

local pyright_opts = vim.tbl_deep_extend('force', opts, require('merlin.lsp.settings.pyright'))
lspconfig.pyright.setup(pyright_opts);

local rust_opts = vim.tbl_deep_extend('force', opts, require('merlin.lsp.settings.rust_analyzer'))
lspconfig.rust_analyzer.setup(rust_opts)

