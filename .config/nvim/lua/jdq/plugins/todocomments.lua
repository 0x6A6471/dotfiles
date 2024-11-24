return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
		colors = {
			hint = { "LspDiagnosticsDefaultHint", "Question" },
		},
	},
}
