return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {
		auto_preview = false,
	},
	config = function(_, opts)
		local trouble = require("trouble")
		trouble.setup(opts)

		local map = function(key, func, desc)
			return require("utils").map_with_prefix("trouble: ")("n", "<leader>" .. key, func, desc)
		end

		local toggle = function(mode)
			return function()
				trouble.toggle(mode)
			end
		end

		map("ts", toggle("symbols"), "[s]ymbols")
		map("td", toggle("diagnostics"), "[d]iagnostics")
		map("tt", toggle("telescope_files"), "[t]elescope")
		map("tr", toggle("lsp"), "[r]eferences and definitions")
	end,
}
