local target_win

return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		prompt = "; ",
		select = {
			select_window = function(_, action)
				if action == "edit" and target_win and vim.api.nvim_win_is_valid(target_win) then
					return target_win
				end
				return nil
			end,
		},
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
				target_win = vim.api.nvim_get_current_win()
				require("fff").find_files()
			end,
			desc = "Find files in current git repository",
		},
		{
			"fs",
			function()
				target_win = vim.api.nvim_get_current_win()
				require("fff").live_grep()
			end,
			desc = "LiFFFe grep",
		},
	},
}
