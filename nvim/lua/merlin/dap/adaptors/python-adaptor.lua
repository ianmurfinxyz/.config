local m = {}

-- I am doing setup for python dap using a plugin which provides a 
-- default setup, hence I don't need to configure the dap myself
-- with dap.adaptors.python nd dap.configurations.python.

function m.setup()
	-- see https://github.com/mfussenegger/nvim-dap-python
	require('dap-python').setup('~/.venv/debugpy/bin/python')
end

return m
