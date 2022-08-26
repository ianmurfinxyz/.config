--------------------------------------------------------------------------------
-- NEOVIM OPTIONS CONFIGURATION
-- author - Ian Murfin - github.com/ianmurfinxz
--------------------------------------------------------------------------------

-- whitespace
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.smartindent = true

-- file encoding
vim.opt.fileencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

-- whitespace rendering using 'list' mode
vim.opt.list = true
vim.opt.listchars='tab:-->,space:.,eol:\u{23f5}'

-- When vim reads in a file, loading it into a buffer, it analyses the line
-- endings in the file and sets a file type. Filetype set to dos, mac or unix
-- if it finds '\r\n', '\r' or '\n' respectively.
--
-- It then replaces the line endings in the buffer with it's own internal
-- representation. You can use 'listchars' to set the character used to display
-- these internal line ending characters.
--
-- If we want to be able to see carriage returns, we can force nvim to read all
-- files as unix files, so it replaces the '\n' with it's line endings, but 
-- leaves all '\r' untouched. It will display these as ^M.
--
-- Force nvim to interpret all files as unix files.
vim.opt.ffs = 'unix'

-- disable enforement of pep8 style for python files; used to allow tabs
vim.g.python_recommended_style = 0
vim.g.rust_recommended_style = 0

-- rendering
vim.opt.cursorline = true
vim.opt.colorcolumn = "101"
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

