--------------------------------------------------------------------------------
-- NEOVIM DEBUG ADAPTOR CONFIGURATION
-- author - Ian Murfin - github.com/ianmurfinxyz
--------------------------------------------------------------------------------

-- Key mappings for general dap
require 'merlin.dap.key_maps'.setup_dap_keymaps()

-- Setup dap-adaptor for lua.
require 'merlin.dap.adaptors.lua-adaptor'

-- Setup dap adaptor for Python.
-- note: this requires installing debugpy. It is recommended to install 
-- debugpy into it's own venv (nvim will run it from that venv) like,
--		python -m venv path/to/virtualenvs/debugpy
--		path/to/virtualenvs/debugpy -m pip install debugpy
require 'merlin.dap.adaptors.python-adaptor'.setup()

-- Setup dap adaptor for C++, C, and Rust.
-- This adaptor uses the lldb debugger which can be installed with,
--		pacman -S lldb
--	Specifically it uses the lldb-vscode debugger which comes with lldb.
-- For more info see,
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
require 'merlin.dap.adaptors.rust-cpp-adaptor'

-- Provides a ui when debugging
require('dapui').setup()

require 'merlin.dap.key_maps'.setup_dap_ui_keymaps()
require 'merlin.dap.signs'.setup_dap_signs()

-- Events to auto open and close the ui when entering the debugger.
local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
	dapui.close()
end

