return {
	"dmtrKovalenko/fff.nvim",
	build = "cargo build --release",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		prompt = "; ",
		debug = {
			enabled = true,
			show_scores = true,
			show_file_info = true,
		},
	},
	keys = {
		{
			"df",
			function()
				require("fff").find_in_git_root()
			end,
			desc = "Find files in current git repository",
		},
		{
			"<C-p>",
			function()
				require("fff").find_files()
			end,
			desc = "Find files in current directory",
		},
	},
}
