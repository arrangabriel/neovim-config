local github_theme = {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false,
	priority = 1000,
	opts = {
		options = {
			transparent = false,
			modules = {
				native_lsp = {
					background = false,
				},
			},
		},
		specs = {
			github_dark_high_contrast = {
				bg0 = "#000000",
				bg1 = "#000000",
				syntax = {
					comment = "#8B949E",
				},
			},
		},
		groups = {
			github_dark_high_contrast = {
				Title = { fg = "#ffffff" },
				Question = { fg = "#ffffff" },
				WarningMsg = { fg = "#ffffff" },
			},
		},
	},
	config = function(_, opts)
		require("github-theme").setup(opts)
		vim.cmd([[colorscheme github_dark_high_contrast]])
	end,
}

local lazydev = {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}

local todo_comments = {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
        signs = false,
    },
}

return {
	github_theme,
	lazydev,
    todo_comments
}
