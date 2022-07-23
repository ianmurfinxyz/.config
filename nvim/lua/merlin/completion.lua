--------------------------------------------------------------------------------
-- NEOVIM COMPLETION ENGINE CONFIGURATION
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

-- Configuration for nvim-cmp and LuaSnip...

local cmp_status_ok, cmp = pcall(require, "cmp")
local luasnip_status_ok, _ = pcall(require, "cmp")

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

-- Find more icons here: 
-- https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

-- Controls the behavior of the completion window.
vim.g.completeopt='menu,menuone,noselect'

local cfg = {}

cfg['snippet'] = {
	expand = function(args)
		require('luasnip').lsp_expand(args.body)
	end,
}

cfg['window'] = {
	completion = cmp.config.window.bordered("╭", "─", "╮", "│", "╯", "─", "╰", "│"),
}

local mappings = {}
mappings['<C-k>'] = cmp.mapping.select_prev_item()
mappings['<C-j>'] = cmp.mapping.select_next_item()
mappings['<Tab>'] = cmp.mapping.confirm({select=true})
mappings['<Esc>'] = cmp.mapping.abort()
cfg['mapping'] = cmp.mapping.preset.insert(mappings)

-- Controls formatting of completion popups.
cfg['formatting'] = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, vim_item)
		-- Kind icons
		vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
		vim_item.menu = ({
			luasnip = "[Snippet]",
			buffer = "[Buffer]",
			path = "[Path]",
		})[entry.source.name]
		return vim_item
	end,
}

-- Sources of completions. The order of elements controls
-- the order in which they appear inside the completion window.
cfg['sources'] = {
	{name = "nvim_lsp"},
	{name = "luasnip"},
	{name = "buffer"},
	{name = "path"},
}

cfg['confirm_opts'] = {
	behavior = cmp.ConfirmBehavior.Replace,
	select = false,
}

cfg['experimental'] = {
	ghost_text = false,
	native_menu = false,
}

cmp.setup(cfg)
