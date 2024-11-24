return {
	"ocaml-mlx/ocaml_mlx.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("ocaml_mlx")
	end,
}
