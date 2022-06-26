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

	------------------------------------------------------------------------------
	-- COMPLETETION ENGINE
	------------------------------------------------------------------------------
	
	-- Core completion engine
	use "hrsh7th/nvim-cmp"

	-- Completion engine requires a snippets engine
	use "L3MON4D3/LuaSnip"

	------------------------------------------------------------------------------
	-- COLOR SCHEMES
	------------------------------------------------------------------------------

	-- TokyoNight color scheme 
	use 'folke/tokyonight.nvim'

	------------------------------------------------------------------------------
	
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
	
end)
--------------------------------------------------------------------------------



