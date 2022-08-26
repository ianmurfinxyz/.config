--------------------------------------------------------------------------------
-- NEOVIM LANGUAGE SERVER INSTALLER CONFIGURATION
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
	print "Failed to find nvim-lsp-installer plugin; cannot configure lsp"
	return
end

lsp_installer.setup({

	-- A list of servers to automatically install if they're not already 
	-- installed. Example: { "rust_analyzer", "sumneko_lua" }
	--
	-- NOTE: This setting has no relation with the `automatic_installation` setting.
	--
	-- NOTE: All these language servers have their own dependencies which 
	-- must be installed in order for this installer to install them. For
	-- example to install 'hls' (the haskell language server) you first 
	-- need to install ghcup from https://www.haskell.org/ghcup/.
	--
	ensure_installed = {
		"rust_analyzer",  -- rust
		"hls",            -- haskell
		"clangd",         -- c/c++
		"omnisharp",      -- c#
		"bashls",         -- bash
		"marksman",       -- markdown
		"sumneko_lua",    -- lua
	},

	-- Whether servers that are set up (via lspconfig) should be automatically 
	-- installed if they're not already installed.
	--
	-- NOTE:This setting has no relation with the `ensure_installed` setting.
	--
	-- Can either be:
	--	- false: Servers are not automatically installed.
	--	- true: All servers set up via lspconfig are automatically installed.
	--	- { exclude: string[] }: All servers set up via lspconfig, except the 
	--	  ones provided in the list, are automatically installed.
	--		 Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	automatic_installation = true,

	ui = {
		-- Whether to automatically check for outdated servers when opening the UI window.
		check_outdated_servers_on_open = true,

		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		},

		keymaps = {
			-- Keymap to expand a server in the UI
			toggle_server_expand = "<CR>",
			-- Keymap to install the server under the current cursor position
			install_server = "i",
			-- Keymap to reinstall/update the server under the current cursor position
			update_server = "u",
			-- Keymap to check for new version for the server under the current cursor position
			check_server_version = "c",
			-- Keymap to update all installed servers
			update_all_servers = "U",
			-- Keymap to check which installed servers are outdated
			check_outdated_servers = "C",
			-- Keymap to uninstall a server
			uninstall_server = "X",
		},
	}
})
