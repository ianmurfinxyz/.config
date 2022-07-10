return {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognise the global nvim.
				globals = {"vim"},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files.
				[vim.fn.expand('$VIMRUNTIME/lua')] = true,
				[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
			},
		}
	}
}
