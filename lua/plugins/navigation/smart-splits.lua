local map = function(key, f)
	return {
		key,
		function()
			f(require("smart-splits"))
		end,
	}
end

return {
	"mrjones2014/smart-splits.nvim",
	opts = {
		default_amount = 5,
		at_edge = "stop",
	},
	keys = {
		map("<C-h>", function(m)
			m.move_cursor_left()
		end),
		map("<C-l>", function(m)
			m.move_cursor_right()
		end),
		map("<C-k>", function(m)
			m.move_cursor_up()
		end),
		map("<C-j>", function(m)
			m.move_cursor_down()
		end),
		map("<C-S-h>", function(m)
			m.resize_left()
		end),
		map("<C-S-l>", function(m)
			m.resize_right()
		end),
		map("<C-S-k>", function(m)
			m.resize_up()
		end),
		map("<C-S-j>", function(m)
			m.resize_down()
		end),
		{ "<C-S-0>", "<C-w>=" },
	},
}
