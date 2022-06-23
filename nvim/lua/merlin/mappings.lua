--------------------------------------------------------------------------------
-- NEOVIM MAPPINGS
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

mu = require("maputil")

local opts = {silent = true}

-- leader prefix used for custom commands
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

-- faster scrolling/movement commands
mu.nnoremap('<S-h>', '10h', opts)
mu.nnoremap('<S-j>', '10j', opts)
mu.nnoremap('<S-k>', '10k', opts)
mu.nnoremap('<S-l>', '10l', opts)

-- faster scrolling/movement commands
mu.nnoremap('<S-A-h>', '5h', opt)
mu.nnoremap('<S-A-j>', '5j', opt)
mu.nnoremap('<S-A-k>', '5k', opt)
mu.nnoremap('<S-A-l>', '5l', opt)

-- easier window navigation
mu.nnoremap('<C-h>', '<c-w>h', opts)
mu.nnoremap('<C-j>', '<c-w>j', opts)
mu.nnoremap('<C-k>', '<c-w>k', opts)
mu.nnoremap('<C-l>', '<c-w>l', opts)

-- easier window resizing
mu.nnoremap('<C-Up>', ':resize +2<CR>', opts)
mu.nnoremap('<C-Down>', ':resize -2<CR>', opts)
mu.nnoremap('<C-Left>', ':vertical resize +2<CR>', opts)
mu.nnoremap('<C-Right>', ':vertical resize -2<CR>', opts)

-- easier buffer navigation
mu.nnoremap('<=>', ':bnext<CR>', opts)
mu.nnoremap('<_>', ':bprevious<CR>', opts)

-- Visual Line --
-- Move text up and down
mu.vnoremap('<A-j>', ':m .+1<CR>==', opts)
mu.vnoremap('<A-k>', ':m .-2<CR>==', opts)

-- Visual Block --
-- Move text up and down
mu.vnoremap("J", ":move '>+1<CR>gv-gv", opts)
mu.vnoremap("K", ":move '<-2<CR>gv-gv", opts)
mu.vnoremap("<A-j>", ":move '>+1<CR>gv-gv", opts)
mu.vnoremap("<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Best mapping ever!
-- Dont store a replaced word from a visual selection in the yank register.
-- This allows you to copy text into the yank buffer and repeat paste it
-- without the text you replace itself replacing the text in the yank
-- register.
mu.vnoremap("p", '"_dP', opts)

-- toggle relative numbers
mu.nnoremap('<leader>rn', ':set relativenumber!<cr>', opts) 

-- Paste from clipboard
mu.nnoremap('<leader>p', '"+p', opts) 

