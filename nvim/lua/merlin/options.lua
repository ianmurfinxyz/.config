--------------------------------------------------------------------------------
-- NEOVIM OPTIONS CONFIGURATION
-- author - Ian Murfin - github.com/ianmurfinxz
--------------------------------------------------------------------------------

vim.opt.fileencoding = "utf-8"

-- whitespace
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.smartindent = true

-- rendering
vim.opt.cursorline = true
vim.opt.colorcolumn = "81"
vim.opt.wrap = false
vim.opt.textwidth = 0
vim.opt.showmode = true
vim.opt.showtabline = 2
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 0
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.guifont = "monospace:h17"
vim.opt.number = true
vim.opt.relativenumber = false

-- whitespace rendering using 'list' mode
vim.opt.list = true
vim.opt.listchars='tab:-->,space:.,'

-- search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- miscellaneous
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.writebackup = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.shortmess:append "c"
