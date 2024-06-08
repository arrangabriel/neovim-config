local M = {}

M.map = function(mode, keys, action, opts)
	local actualOpts = opts or {}
	actualOpts.silent = false
	vim.keymap.set(mode, keys, action, actualOpts)
end

return M
