local M = {}

M.map = function(mode, keys, action, opts)
	local actualOpts = opts or {}
	actualOpts.silent = false
	vim.keymap.set(mode, keys, action, actualOpts)
end

M.map_with_prefix = function(prefix, opts)
	local actual_opts = opts or {}
	return function(mode, keys, action, desc)
		actual_opts.desc = prefix .. desc
		M.map(mode, keys, action, actual_opts)
	end
end

return M
