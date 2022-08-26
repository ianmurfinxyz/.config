local dap = require('dap')

dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode',
	name = 'lldb'
}

dap.configurations.rust = {
	-- This table is a json launch configuration, see,
	-- https://github.com/llvm/llvm-project/tree/main/lldb/tools/lldb-vscode#launch-configuration-settings
	--
	-- It is a 'hard coded' launch configuration which is not very useful since launch.json files
	-- need to be configured per project since they contain the path to the exe and the args etc.
	--
	-- There are plugins which can dynamically create these launch configurations (or perhaps read
	-- them from disk?) so that you can set them up on a per project basis.
	--
	-- note that for now I have just setup functions to map to request input from the user for 
	-- the data in the launch.json that is per project.
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
		  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = function()
		  local arg_line = vim.fn.input('args: ')
			local tokens = {}
			for token in string.gmatch(arg_line, "[^%s]+") do
				table.insert(tokens, token)
			end
			return tokens
		end,
	}
}

dap.configurations.cpp = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
		  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = function()
		  local arg_line = vim.fn.input('args: ')
			local tokens = {}
			for token in string.gmatch(arg_line, "[^%s]+") do
				table.insert(tokens, token)
			end
			return tokens
		end,
	}
}

dap.configurations.c = dap.configurations.cpp
