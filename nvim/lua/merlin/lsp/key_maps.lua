
local m = {}

-- see :help lsp for all available functions that can be mapped to keys.
local function setup_lsp_keymaps(client, bufnr, keymap, opts)
	-- 'server_capabilities' is a json structure defined by the lsp specification
	-- which is provided by the server to indicate what it can do, see:
	-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
	-- local caps = client.server_capabilities

	-- Jump to decleration of symbol under cursor
	keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

	-- Jump to definition of symbol under cursor
	keymap(bufnr, "n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

	-- Jump to definition of symbol under cursor's type
	keymap(bufnr, "n", "<leader>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

	-- List all references of symbol under cursor in quick fix window
	keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

	-- Display info/help about symbol under cursor
	keymap(bufnr, "n", "?", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

	-- Rename all references to symbol under cursor
	keymap(bufnr, "n", "<leader>R", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

	-- List all implementations for symbol under cursor
	keymap(bufnr, "n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

	-- Perform a code action. Different servers provide different code actions, see the
	-- server_capabilities struct and the codeActionProvider key which contains a list
	-- of 'codeActionKinds' which are available for a server.
	keymap(bufnr, "n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	--keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- Diagnostics are errors that can come from a multitude of sources, including language
-- servers. see :help diagnostics for all available functions that can be mapped to keys.
local function setup_diagnostics_keymaps(client, bufnr, keymap, opts)
	-- Jump to previous diagnostic in current buffer.
	keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

	-- Jump to next diagnostic in current buffer.
	keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

	-- Open diagnostic of current line in a floating window.
	keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	-- Open a quickfix window of all diagnostics.
	keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

function m.on_attach(client, bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap

	setup_lsp_keymaps(client, bufnr, keymap, opts)
	setup_diagnostics_keymaps(client, bufnr, keymap, opts)
end

return m
