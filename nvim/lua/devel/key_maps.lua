local mu = require('util.maputil')

local opts = {silent = true}

-- Execute the current file. Useful for testing code I am currently working on.
mu.nnoremap('<leader><leader>x', '<cmd>source %<CR>', opts)


