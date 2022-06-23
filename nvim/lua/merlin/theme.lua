--------------------------------------------------------------------------------
-- THEME CONFIGURATION
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

local colorscheme = 'tokyonight'

-- note: tokyonight options must be set before setting the colorscheme.

vim.g.tokyonight_style = "storm"

-- 'default' colorscheme will be used if the preferred colorscheme is
-- not found.
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Failed to set colorscheme '" .. colorscheme .. "'; not found!")
	return
end
