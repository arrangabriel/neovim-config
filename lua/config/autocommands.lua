-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Set buffer local variable if file is in git repository
vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Set vim.b.git_root if file is in git repository",
    group = vim.api.nvim_create_augroup("set-git-root", { clear = true }),
    callback = function()
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error == 0 then
            vim.b.git_root = git_root
        else
            vim.b.git_root = nil
        end
    end,
})
