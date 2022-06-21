--------------------------------------------------------------------------------
-- NEOVIM KEY MAPPING UTILITIES
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

local maputil = {}

-- \brief - Create normal mode non-recursive map of lhs -> rhs.
function maputil.nnoremap(lhs, rhs, extra_options)
	local options = {noremap = true}
	if extra_options then
		options = vim.tbl_extend("force", options, extra_options)
	end
	vim.api.nvim_set_keymap("n", lhs, rhs, options)
end

-- \brief - Create insert mode non-recursive map of lhs -> rhs.
function maputil.inoremap(lhs, rhs, extra_options)
	local options = {noremap = true}
	if extra_options then
		options = vim.tbl_extend("force", options, extra_options)
	end
	vim.api.nvim_set_keymap("i", lhs, rhs, options)
end

-- \brief - Create visual mode non-recursive map of lhs -> rhs.
function maputil.vnoremap(lhs, rhs, extra_options)
	local options = {noremap = true}
	if extra_options then
		options = vim.tbl_extend("force", options, extra_options)
	end
	vim.api.nvim_set_keymap("v", lhs, rhs, options)
end

return maputil
