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

--   פּ ﯟ   some other good icons
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
-- find more here: https://www.nerdfonts.com/cheat-sheet

-- Controls menu behavior, see :help completeopt.
vim.g.completeopt=menu,menuone,noselect

-- For help on cmp configuration see :help cmp-config-helper
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered("╭", "─", "╮", "│", "╯", "─", "╰", "│"),
		documentation = cmp.config.window.bordered("╭", "─", "╮", "│", "╯", "─", "╰", "│"),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		--["<CR>"] = cmp.mapping.confirm { select = true },
		---- Smart tab mappings. These allow you to tab through a snippet.
		--["<Tab>"] = cmp.mapping(function(fallback)
		--	if cmp.visible() then
		--		cmp.select_next_item()
		--	elseif luasnip.expandable() then
		--		luasnip.expand()
		--	elseif luasnip.expand_or_jumpable() then
		--		luasnip.expand_or_jump()
		--	elseif check_backspace() then
		--		fallback()
		--	else
		--		fallback()
		--	end
		--end, {
		--	"i",
		--	"s",
		--}),
		--["<S-Tab>"] = cmp.mapping(function(fallback)
		--	if cmp.visible() then
		--		cmp.select_prev_item()
		--	elseif luasnip.jumpable(-1) then
		--		luasnip.jump(-1)
		--	else
		--		fallback()
		--	end
		--end, {
		--	"i",
		--	"s",
		--}),
	}),
	-- Controls formatting of completion popups.
	formatting = {
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
	},
	-- The order of the sources determines the order result of these
	-- kinds are listed in the completion menu. See :help cmp-config-sources.
	sources = {
		{name = "luasnip"},
		{name = "buffer"},
		{name = "path"},
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})

-- Super-tab setup. What is a super tab? Multifunctionally tab behavior;
-- allows us to jump through our snippets with the tab key.

