return {
	"stevearc/dressing.nvim",
	opts = {
		input = {
			enabled = true,
			default_prompt = "Input",
			trim_prompt = true,
			title_pos = "left",
			start_in_insert = true,
			border = "none",
			-- 'editor' and 'win' will default to being centered
			relative = "cursor",
			-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			prefer_width = 40,
			width = nil,
			-- min_width and max_width can be a list of mixed types.
			-- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
			max_width = { 140, 0.9 },
			min_width = { 20, 0.2 },
			mappings = {
				n = {
					["<Esc>"] = "Close",
					["<CR>"] = "Confirm",
				},
				i = {
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
					["<Up>"] = "HistoryPrev",
					["<Down>"] = "HistoryNext",
				},
			},
		},
		select = {
			enabled = false,
		},
	},
}
