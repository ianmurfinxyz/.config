--------------------------------------------------------------------------------
-- THEME CONFIGURATION
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

local colorscheme = 'tokyonight'

-- note: tokyonight options must be set before setting the colorscheme.

vim.g.tokyonight_style = "night"

-- All colors in the colorscheme can be overriden. To see which colors
-- can be set see the file: 
-- ~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/lua/tokyonight
vim.g.tokyonight_colors = {
	none = "NONE",
	bg_dark = "#1f2335",
	bg = "#14161c",
	bg_highlight = "#292e42",
	terminal_black = "#414868",
	fg = "#c0caf5",
	fg_dark = "#a9b1d6",
	fg_gutter = "#3b4261",
	dark3 = "#545c7e",
	comment = "#565f89",
	dark5 = "#737aa2",
	blue0 = "#3d59a1",
	blue = "#7aa2f7",
	cyan = "#7dcfff",
	blue1 = "#2ac3de",
	blue2 = "#0db9d7",
	blue5 = "#89ddff",
	blue6 = "#B4F9F8",
	blue7 = "#394b70",
	magenta = "#bb9af7",
	magenta2 = "#ff007c",
	purple = "#9d7cd8",
	orange = "#ff9e64",
	yellow = "#e0af68",
	green = "#9ece6a",
	green1 = "#73daca",
	green2 = "#41a6b5",
	teal = "#1abc9c",
	red = "#f7768e",
	red1 = "#db4b4b"
}

-- 'default' colorscheme will be used if the preferred colorscheme is
-- not found.
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Failed to set colorscheme '" .. colorscheme .. "'; not found!")
	return
end

-- disable background color (use the terminals instead to allow opacity).
-- note: must run this after setting the colorscheme to override the schemes 
-- background setting.
vim.cmd('hi Normal guibg=NONE')

-- color of the split border
vim.cmd('hi VertSplit guibg=NONE guifg=#9ece6a')

-- color of the color column.
vim.cmd('hi ColorColumn guibg=#a9b1d6 guifg=#a9b1d6')
