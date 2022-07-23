--------------------------------------------------------------------------------
-- NEOVIM PLUGINS
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print "Failed to setup plugins; Packer plugin manager not installed!"
	return
end

-- Have Packer print output in a popup window rather than a split window.
packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float {border = 'rounded'}
		end
	}
}

--------------------------------------------------------------------------------
-- PLUGIN INSTALLATION
--------------------------------------------------------------------------------
return packer.startup(function(use)

	-- Have packer manage itself
	use "wbthomason/packer.nvim"

	-- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/popup.nvim"

	-- Useful lua functions used by lots of plugins
	use "nvim-lua/plenary.nvim"

	-- Core completion engine
	use "hrsh7th/nvim-cmp"
	use 'hrsh7th/cmp-nvim-lsp' -- lsp source for completion engine.
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

	-- Git integration
	use 'tpope/vim-fugitive'

	-- Completion engine requires a snippets engine
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

	-- Color schemes
	use 'folke/tokyonight.nvim'
	use 'Mofiqul/dracula.nvim'

	-- LSP
	-- Collection of community-driven language server configurations for
	-- the language server client built into neovim. Not required to use
	-- lsp in neovim but makes it easier. See help lspconfig. see help: lsp
	use 'neovim/nvim-lspconfig'

	-- Simple to use language server installer. Works with nvim-lspconfig.
	use 'williamboman/nvim-lsp-installer'

	-- Debug Adaptor for lua.
	-- see :help osv
	use 'jbyuki/one-small-step-for-vimkind'

	-- Debug Client for nvim debugging.
	-- see :help dap-configuration
	use 'mfussenegger/nvim-dap'

	-- ui front-end to nvim dap.
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

	-- tree viewer panel
	-- see :help nvim-tree
	use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons'} }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

end)
--------------------------------------------------------------------------------
