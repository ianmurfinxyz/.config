local mu = require("util.maputil")
local opts = {silent = true}

--============================================================================--
-- MISCELLANOUS
--------------------------------------------------------------------------------

-- find files in cwd
mu.nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>", opts)
-- searches for any string in cwd (respecting gitignore)
mu.nnoremap("<leader>fs", "<cmd>Telescope live_grep<CR>", opts)
-- search open vim buffers
mu.nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>", opts)
-- search available color schemes
mu.nnoremap("<leader>fc", "<cmd>Telescope colorscheme<CR>", opts)
-- search items in quickfix list
mu.nnoremap("<leader>fq", "<cmd>Telescope quickfix<CR>", opts)
-- search help tags
mu.nnoremap("<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
-- search vim registers
mu.nnoremap("<leader>fr", "<cmd>Telescope registers<CR>", opts)
-- search keymaps
mu.nnoremap("<leader>fk", "<cmd>Telescope keymaps<CR>", opts)

--============================================================================--
-- IDE
--------------------------------------------------------------------------------

-- search diagnostics (errors)
mu.nnoremap("<leader>fd", "<cmd>Telescope diagnostics<CR>", opts)

--============================================================================--
-- GIT
--------------------------------------------------------------------------------

-- list git commits with diff preview and available commands:
--   <cr>   = checkout
--   <C-r>m = reset mixed
--   <C-r>s = reset soft
--   <C-r>h = reset hard
mu.nnoremap("<leader>fgc", "<cmd>Telescope git_commits<CR>", opts)
-- list git commits for changes in current buffer with diff preview and available commands:
--   <cr>   = checkout
mu.nnoremap("<leader>fgbc", "<cmd>Telescope git_bcommits<CR>", opts)
-- list git branches
--   <cr>   = checkout
--   <C-t>  = track action
--   <C-r>  = rebase action
mu.nnoremap("<leader>fgb", "<cmd>Telescope git_branches<CR>", opts)
-- list current changes per file (i.e. git status)
mu.nnoremap("<leader>fgs", "<cmd>Telescope git_status<CR>", opts)
-- list stash items in current repo with available commands:
--   <cr>   = apply stash
mu.nnoremap("<leader>fgs", "<cmd>Telescope git_status<CR>", opts)
