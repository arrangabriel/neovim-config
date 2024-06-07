local M = {}

M.map = function(mode, keys, action, opts)
	local actualOpts = opts or {}
	vim.keymap.set(mode, keys, action, actualOpts)
end

return M
