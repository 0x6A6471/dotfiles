return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		highlight = {
			pattern = [[.*<(KEYWORDS)%(\([^)]*\))?\s*:]],
		},
		search = {
			pattern = [[\b(KEYWORDS)(\([^)]*\))?:]],
		},
		colors = {
			info = { "#8ebeec" },
		},
	},
}
