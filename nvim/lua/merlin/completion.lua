--------------------------------------------------------------------------------
-- NEOVIM COMPLETION ENGINE CONFIGURATION
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

-- Configuration for nvim-cmp and LuaSnip...

local cmp_status_ok, cmp = pcall(require, "cmp")
local luasnip_status_ok, luasnip = pcall(require, "cmp")

if not cmp_status_ok then
	print "Failed to find nvim-cmp completion engine plugin!"
end

if not luasnip_status_ok then
	print "Failed to find lua-snip snippets engine plugin!"
end

if not cmp_status_ok or not luasnip_status_ok then
	print "Cannot configure completion engine!"
	return
end

-- Use the vs-code format snippet loader so we can use vs-code formatted
-- snippets. See https://github.com/L3MON4D3/LuaSnip for details on snippet
-- loaders provided by luasnip.
require("luasnip.loaders.from_vscode").lazy_load()

-- Super-tab setup. What is a super tab? Multifunctionally tab behavior;
-- allows us to jump through our snippets with the tab key.

