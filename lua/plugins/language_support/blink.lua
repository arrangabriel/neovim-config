return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"xzbdmw/colorful-menu.nvim",
	},
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<C-Space>"] = { "show" },
			["<C-f>"] = { "accept", "fallback" },
			["<C-p>"] = { "select_prev" },
			["<C-n>"] = { "select_next" },
			["<C-d>"] = { "show_documentation" },
			["<C-S-p>"] = { "scroll_documentation_up" },
			["<C-S-n>"] = { "scroll_documentation_down" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		completion = {
			list = { selection = { auto_insert = false } },
			menu = {
				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
			ghost_text = {
				enabled = true,
			},
		},
	},
	opts_extend = { "sources.default" },
	config = function(_, opts)
		require("blink.cmp").setup(opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuOpen",
			callback = function()
				require("copilot.suggestion").dismiss()
				vim.b.copilot_suggestion_hidden = true
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuClose",
			callback = function()
				vim.b.copilot_suggestion_hidden = false
			end,
		})
	end,
}
