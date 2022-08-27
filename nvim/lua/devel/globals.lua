-- Print the inspecting thing. Really useful for printing tables, e.g.
-- from the command mode,
--   :lua P(package.loaded)
-- to inspect/print the table.
P = function(v)
	print(vim.inspect(v)) -- vim.inspect returns string repr of table
	return v
end
