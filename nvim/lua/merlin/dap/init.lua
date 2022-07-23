--------------------------------------------------------------------------------
-- NEOVIM DEBUG ADAPTOR CONFIGURATION
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

local mu = require 'maputil'

local opts = { silent = true }

-- Setup dap client mappings.
-- see :help dap.txt
-- see :help dap-mappings
-- see :help osv-server
--mu.nnoremap("<F6>", "<cmd>lua require('osv').stop(1)<CR>", opts)
mu.nnoremap("<F7>", "<cmd>lua require('osv').run_this()<CR>", opts)
mu.nnoremap("<F8>", "<cmd>lua require('dap').continue()<CR>", opts)
mu.nnoremap("<F9>", "<cmd>lua require('dap').step_out()<CR>", opts)
mu.nnoremap("<F10>", "<cmd>lua require('dap').step_over()<CR>", opts)
mu.nnoremap("<F11>", "<cmd>lua require('dap').step_into()<CR>", opts)
mu.nnoremap("<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)

-- setup dap-adaptor for lua.
require 'merlin.dap.adaptors.lua-adaptor'

-- setup dap-adaptor for python.
-- note: this requires installing debugpy. It is recommended to install 
-- debugpy into it's own venv (nvim will run it from that venv) like,
--		python -m venv path/to/virtualenvs/debugpy
--		path/to/virtualenvs/debugpy -m pip install debugpy
require 'merlin.dap.adaptors.python-adaptor'.setup()

-- setup the dap-ui
require('dapui').setup()

-- setup dap-ui mappings
mu.nnoremap("<F4>", "<cmd>lua require('dapui').toggle()<CR>", opts)

-- events to auto open and close the ui when entering the debugger.
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

