local m = {}
local mu = require 'util.maputil'
local opts = { silent = true }

-- Setup dap client mappings.
-- see :help dap.txt which docs th dap API
-- see :help dap-mappings
-- see :help osv-server
function m.setup_dap_keymaps()
	--mu.nnoremap("<F7>", "<cmd>lua require('osv').run_this()<CR>", opts)
	mu.nnoremap("<F6>", "<cmd>lua require('dap').terminate()<CR>", opts)
	mu.nnoremap("<F8>", "<cmd>lua require('dap').continue()<CR>", opts)
	mu.nnoremap("<F9>", "<cmd>lua require('dap').step_out()<CR>", opts)
	mu.nnoremap("<F10>", "<cmd>lua require('dap').step_over()<CR>", opts)
	mu.nnoremap("<F11>", "<cmd>lua require('dap').step_into()<CR>", opts)
	mu.nnoremap("<F12>", "<cmd>lua require('dap').repl.open()<CR>", opts)
	mu.nnoremap("<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
end

function m.setup_dap_ui_keymaps()
	mu.nnoremap("<F4>", "<cmd>lua require('dapui').toggle()<CR>", opts)
end

return m
