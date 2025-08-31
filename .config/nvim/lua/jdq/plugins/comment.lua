return {
	{
		"numToStr/Comment.nvim",
		config = function()
			-- set up ocaml_mlx to use the same formatter as ocaml
			local ft = require("Comment.ft")
			ft.ocaml_mlx = ft.get("ocaml")

			require("Comment").setup()
		end,
	},
}
