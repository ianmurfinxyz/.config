-- see :help nvim-tree for full list of options.
require("nvim-tree").setup()

local mu = require('util.maputil')

mu.nnoremap('<F1>', ':NvimTreeToggle<CR>', opts)
