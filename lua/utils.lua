local M = {}

M.map_with_prefix = function(prefix, opts)
	local actual_opts = opts or {}
	return function(mode, keys, action, desc)
		actual_opts.desc = prefix .. desc
		M.map(mode, keys, action, actual_opts)
	end
end

M.map = function(mode, keys, action, opts)
	vim.keymap.set(mode, keys, action, opts or {})
end

M.map_silent = function(mode, keys, action)
	M.map(mode, keys, action, { silent = true })
end

return M
