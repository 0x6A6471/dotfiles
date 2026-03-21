return {
	"dmtrKovalenko/fff.nvim",
	tag = "v0.4.2",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		prompt = "; ",
		debug = {
			enabled = true,
			show_scores = true,
			show_file_info = false,
		},
	},
	keys = {
		{
			"df",
			function()
				require("fff").find_files()
			end,
			desc = "Find files in current git repository",
		},
		{
			"fs",
			function()
				require("fff").live_grep()
			end,
			desc = "LiFFFe grep",
		},
	},
}
