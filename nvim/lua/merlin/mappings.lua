--------------------------------------------------------------------------------
-- NEOVIM MAPPINGS
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

maputil = require("maputil")

-- leader prefix used for custom commands
vim.g.mapleader = ' '   

-- faster scrolling/movement commands
maputil.nnoremap('<S-h>', '10h', {silent = true})    
maputil.nnoremap('<S-j>', '10j', {silent = true})    
maputil.nnoremap('<S-k>', '10k', {silent = true})    
maputil.nnoremap('<S-l>', '10l', {silent = true})    

-- easier window navigation
maputil.nnoremap('<leader>h', '<c-w>h', {silent = true})
maputil.nnoremap('<leader>j', '<c-w>j', {silent = true})
maputil.nnoremap('<leader>k', '<c-w>k', {silent = true})
maputil.nnoremap('<leader>l', '<c-w>l', {silent = true})

-- toggle relative numbers
maputil.nnoremap('<leader>rn', ':set relativenumber!<cr>', {silent = true}) 

-- Paste from clipboard
maputil.nnoremap('<leader>p', '"+p', {silent = true}) 

