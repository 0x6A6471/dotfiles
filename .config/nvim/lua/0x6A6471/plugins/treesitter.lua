return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"eex",
					"elixir",
					"heex",
					"javascript",
					"lua",
					"markdown",
					"markdown_inline",
					"ocaml",
					"ocaml_interface",
					"python",
					"query",
					"rust",
					"typescript",
					"tsx",
					"vim",
					"vimdoc",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
					disable = {
						"ocaml",
						"ocaml_interface",
						"ocaml_mlx",
					},
				},
			})
		end,
	},
}
